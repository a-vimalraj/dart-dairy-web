@HtmlImport('todo_input.html')
library dairy_web.lib.todo.todo_input;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:dairy_web/beans.dart';

@PolymerRegister('todo-input')
class TodoInput extends PolymerElement {

  TodoInput.created():super.created();

  @property
  bool simple = true;

  @Property(notify:true)
  String inputValue = null;
  
  @reflectable
  onAddTodo(Event e, Object o) {
    if(inputValue==null){
      return;
    }
    Todo todo = new Todo.basic(inputValue, false);
    Object detail = {'todo':todo};
    this.fire('add-todo',detail:detail);
    set("inputValue",null);
  }
  
  @reflectable
  checkConfirmation(KeyboardEvent e, Object obj) {
    if (e.keyCode == 13) {
      e.preventDefault();
      onAddTodo(null,null);
      e.target.blur();
    }
  }

}