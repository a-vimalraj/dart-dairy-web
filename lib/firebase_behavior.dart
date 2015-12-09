library dairy_web.lib.firebase_behavior;

import 'package:polymer/polymer.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/src/event.dart' as fb;
import 'dart:async';
import 'dart:mirrors';

abstract class FirebaseBehavior {
  Firebase _ref;

  String _library;

  String _type;

  String _listName;

  @Property(notify: true, reflectToAttribute: true)
  FirebaseDataWorker worker;
  init(String lib, String type, String name) {
    this._library = lib;
    this._type = type;
    this._listName = name;
  }

  @property
  bool logging = false;

  @property
  String location;
  StreamSubscription _onChangedSubs = null;
  StreamSubscription _onMovedSubs = null;
  StreamSubscription _onAddedSubs = null;
  StreamSubscription _onDeletedSubs = null;
  bool _dataLoaded = false;

  @Observe('location')
  onLocationChanged(_) {
    if (_ref != null) {
      _onAddedSubs.cancel();
      _onChangedSubs.cancel();
      _onMovedSubs.cancel();
      _onDeletedSubs.cancel();
    }
    _ref = new Firebase(location);
    _ref.onValue.listen(_onValue);
    _onChangedSubs = _ref.onChildChanged.listen(_onChildChanged);
    _onMovedSubs = _ref.onChildMoved.listen(_onChildMoved);
    _onAddedSubs = _ref.onChildAdded.listen(_onChildAdded);
    _onDeletedSubs = _ref.onChildRemoved.listen(_onDeleted);
    setPath('worker', new FirebaseDataWorker(_ref));
    _dataLoaded = false;
  }

  _onValue(fb.Event e) {
    if (!_dataLoaded) {
      log(e.snapshot.val());
      Map map = e.snapshot.val();
      map.forEach((k, v) {
        var inst = getNewInstance();
//        Todo _todo = new Todo()
        inst.initFromMap(v);
        inst.firebaseKey = k;
        addPath(_listName, inst);
      });
      _dataLoaded = true;
    }
  }

  _onChildChanged(fb.Event e) {
    if (_dataLoaded) {
      log("Changed : ${e.snapshot.val()}");
      var inst = getNewInstance();
      inst.initFromMap(e.snapshot.val());
      inst.firebaseKey = e.snapshot.key;

      int index = getData().indexOf(inst);
      setPath('$_listName.$index', inst);
    }
  }

  _onDeleted(fb.Event e) {
    if (_dataLoaded) {
      log("Deleted : ${e.snapshot.val()}");
      removePath(_listName, (_) => _.firebaseKey == e.snapshot.key);
    }
  }

  _onChildMoved(fb.Event e) {
    log("Moved : ${e.snapshot.val()}");
  }

  _onChildAdded(fb.Event e) {
    if (_dataLoaded) {
      log("Added : ${e.snapshot.val()}");
      Map map = e.snapshot.val();
      var inst = getNewInstance();
      inst.initFromMap(map);
      inst.firebaseKey = e.snapshot.key;
      addPath(_listName, inst);
    }
  }

  void log(var msg) {
    if (logging) {
      print("Todo Data : $msg");
    }
  }

  getNewInstance() {
    var symbol = new Symbol(_type);
    var librarySymbol = new Symbol(_library);
    var myClasses = currentMirrorSystem()
        .findLibrary(librarySymbol)
        .declarations
        .values
        .where((dm) => dm is ClassMirror);
    var cm = myClasses.firstWhere((cm) => cm.simpleName == symbol);
    var instance = cm.newInstance(const Symbol(''), []).reflectee;
    return instance;
  }

  setPath(String path, var value);

  addPath(String path, var value);

  removePath(String path, var value);

  getData();
}

class FirebaseDataWorker {
  Firebase ref;

  FirebaseDataWorker(Firebase ref) {
    this.ref = ref;
  }

  @reflectable
  add(var data) {
    ref.push(value: data.toMap());
  }

  @reflectable
  removeByKey(String key) {
    ref.child(key).remove();
  }

  update(var data) {
    ref.child(data.firebaseKey).set(data.toMap());
  }
}
