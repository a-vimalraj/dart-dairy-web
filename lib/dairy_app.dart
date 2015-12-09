// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
@HtmlImport('dairy_app.html')
@HtmlImport('dairy_icons.html')
@HtmlImport('todo/todo_view.html')
library dairy_web.lib.dairy_app;

import 'dart:html';

import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/editor_icons.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_submenu.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/iron_flex_layout.dart';

import 'package:polymer_elements/paper_tabs.dart';
import 'package:polymer_elements/paper_tab.dart';
import 'package:polymer_elements/iron_pages.dart';

import 'package:polymer_elements/paper_icon_item.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_item_body.dart';

import 'package:polymer_elements/paper_input.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

/// Uses [PaperInput]
@PolymerRegister('dairy-app')
class MainApp extends PolymerElement {
  @property
  String text;

  @Property(notify:true)
  int todoTabSelected =0;

  /// Constructor used to create instance of DairyApp.
  MainApp.created() : super.created();

  @reflectable
  String reverseText(String text) {
    return text.split('').reversed.join('');
  }

  @reflectable
  void onBlurEvent(Event e , Object o){
    print("Main Blur");
  }

  // Optional lifecycle methods - uncomment if needed.

//  /// Called when an instance of main-app is inserted into the DOM.
//  attached() {
//    super.attached();
//  }

//  /// Called when an instance of main-app is removed from the DOM.
//  detached() {
//    super.detached();
//  }

//  /// Called when an attribute (such as a class) of an instance of
//  /// main-app is added, changed, or removed.
//  attributeChanged(String name, String oldValue, String newValue) {
//    super.attributeChanged(name, oldValue, newValue);
//  }

//  /// Called when main-app has been fully prepared (Shadow DOM created,
//  /// property observers set up, event listeners attached).
//  ready() {
//  }
}
