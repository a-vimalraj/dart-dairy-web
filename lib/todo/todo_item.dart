@HtmlImport('todo_item.html')

library dairy_web.lib.todo.todo_item;


import 'todo_menu.dart';

import 'package:polymer_elements/paper_styles.dart';
import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/paper_checkbox.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';
import '../beans.dart';
import 'package:web_components/html_import_annotation.dart';

@PolymerRegister('todo-item')
class TodoItem extends PolymerElement{

  TodoItem.created():super.created();

  @Property(notify:true)
  Todo todo;

  @Property(notify:true)
  bool active = false;

  static const hostAttributes = const {
    'tabindex': 0,
  };

  @Listen("focus")
  @Listen("mouseenter")
  activate(Event e,Object obj){
    set("active" , true);
  }

  @Listen('blur')
  @Listen('mouseleave')
  deactivate(Event e,Object obj){
    set("active" , false);
  }

  @reflectable
  int computeElevation(_)=>_ ? 2 : 0;

  @reflectable
  String computeLabelClass(_) => (_!=0)?'label':'';

  @reflectable
  String computeLabelId(uid) =>'todoItemLabel-' + uid;

  @reflectable
  checkConfirmation(KeyboardEvent e,Object obj) {
    if (e.keyCode == 13) {
      e.preventDefault();
      e.target.blur();
    }
  }

  @reflectable
  onTitleChanged(Event e,Object o){
    Object detail = {'todo':todo};
    this.fire('update-todo',detail:detail);
  }

  @reflectable
  computePriorityClass(String _) => _.length==0?'':_.toLowerCase();

  @reflectable
  computePriorityIcon(_) => _.length==0?'dairy:hollow-flag':'flag';
//
//  @reflectable
//  onTodoMenu(Event e,Object o) {
//    Object detail = {'todo':this.todo};
//    this.fire('open-todo-menu', detail:detail);
//  }

  @Observe('todo.*')
  onTodoChanged(Map changeRecord){
    if(changeRecord['path']!='todo.title') {
      Object detail = {'todo':todo};
      this.fire('update-todo', detail:detail);
    }
  }


}