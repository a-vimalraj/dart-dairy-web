library dairy_web.lib.beans;
import 'package:polymer/src/common/js_proxy.dart';
import 'package:polymer/src/common/reflectable.dart';
import 'package:dairy_web/exportable.dart';


@Export(Todo)
class Todo extends Exportable with JsProxy {
  @reflectable
  @export
  String title;

  @reflectable
  @export
  bool isCompleted;

  @reflectable
  String firebaseKey;

  DateTime startDate = new DateTime.now();

  DateTime dueDate= new DateTime.now();

//  Project project = new Project();

  @reflectable
  @export
  String priority = '';

//  List<Label> labels = new List<Label>();

  operator ==(Todo _todo){
    return (_todo.firebaseKey == this.firebaseKey);
  }

  Todo();

  Todo.basic(this.title,this.isCompleted);

//  toMap() {
//    return {
//      'title':this.title,
//      'isCompleted':this.isCompleted
//    };
//  }
//
//  Todo.fromMap(Map map){
//    map.forEach((k, v) {
//      switch (k) {
//        case 'title':
//          this.title = v;
//          break;
//        case 'isCompleted':
//          this.isCompleted = v;
//          break;
//      }
//    });
//  }
}


class Project extends Object with JsProxy {
  @reflectable
  String id = "-";

  @reflectable
  String name = "-";

  Project();

  Project.basic(this.name);
}

class Label extends Object with JsProxy {
  @reflectable
  String id = "-";

  @reflectable
  String name = "-";

  Label();

  Label.basic(this.name);
}