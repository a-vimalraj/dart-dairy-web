@HtmlImport('todo_data.html')
library dairy_web.lib.todo.todo_data;

import 'package:web_components/web_components.dart';
import 'package:polymer/polymer.dart';
import 'package:dairy_web/beans.dart';
import 'package:polymer_elements/firebase_query_behavior.dart';
import 'package:polymer_elements/firebase_collection.dart';
import 'dart:html';
import 'dart:js';
import 'package:firebase/firebase.dart';
import 'package:firebase/src/event.dart' as fb;
import 'dart:async';
import 'dart:mirrors';
import 'package:dairy_web/firebase_behavior.dart';

@PolymerRegister('todo-data')
class TodoData extends PolymerElement with FirebaseBehavior {
  TodoData.created() : super.created();

  attached() {
    init('dairy_web.lib.beans', 'Todo', "todos");
  }

  @Property(notify: true, reflectToAttribute: true)
  List<Todo> todos = new List<Todo>();

  getData() {
    return todos;
  }

  setPath(String path, var value) => set(path, value);

  addPath(String path, var value) => add(path, value);

  removePath(String path, var value) => removeWhere(path, value);
}
