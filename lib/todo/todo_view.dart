@HtmlImport('todo_view.html')
library dairy_web.lib.todo.todo_view;

import 'todo_list.dart';
import 'todo_input.dart';
import 'todo_data.dart';
import 'package:polymer_elements/paper_styles.dart';
import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/paper_checkbox.dart';
import 'package:polymer/polymer.dart';
import '../beans.dart';
import 'package:web_components/html_import_annotation.dart';
import 'dart:html';
import 'package:dairy_web/firebase_behavior.dart';

@PolymerRegister('todo-view')
class TodoView extends PolymerElement {
  TodoView.created() : super.created();

  @Property(notify: true)
  List<Todo> todos = new List<Todo>();

  @Property(notify: true)
  FirebaseDataWorker worker;

  @reflectable
  onAddTodo(Event e, Object o) {
    Todo todo = o['todo'];
    worker.add(todo);
  }

  @reflectable
  onDeleteTodo(Event e, Object o) {
    Todo todo = o['todo'];
    worker.removeByKey(todo.firebaseKey);
  }

  @reflectable
  onUpdateTodo(Event e, Object o) {
    Todo todo = o['todo'];
    worker.update(todo);
  }
}
