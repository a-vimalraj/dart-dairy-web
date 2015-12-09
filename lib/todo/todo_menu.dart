@HtmlImport('todo_menu.html')
library dairy_web.lib.todo.todo_menu;
import 'package:web_components/html_import_annotation.dart';
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/paper_menu_button.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_item_body.dart';
import 'package:dairy_web/beans.dart';
import 'dart:html';

@PolymerRegister('todo-menu')
class TodoMenu extends PolymerElement {

  @Property(notify:true)
  Todo todo;
  TodoMenu.created():super.created();

  static const hostAttributes = const {
    'tabindex': 0,
  };

  @reflectable
  onTabDelete(Event e,Object o){
    this.fire('delete-todo',detail:{'todo':todo});
  }
}