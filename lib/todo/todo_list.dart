@HtmlImport('todo_list.html')

library dairy_web.lib.todo.todo_list;

import 'todo_item.dart';
import 'package:polymer/polymer.dart';
import '../beans.dart';
import 'package:web_components/html_import_annotation.dart';

@PolymerRegister('todo-list')
class TodoList extends PolymerElement {
  TodoList.created():super.created();

  @Property(notify:true,reflectToAttribute:true)
  List<Todo> todos = new List<Todo>();

  @reflectable
  todosEmpty(length) => length !=0;

  attached(){
    print('todo_list${todos.length}');
  }
}