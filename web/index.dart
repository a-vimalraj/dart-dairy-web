// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library my_project.web.index;

import 'package:dairy_web/dairy_app.dart';
import 'package:dairy_web/todo/todo_view.dart';
import 'package:dairy_web/todo/todo_list.dart';
import 'package:dairy_web/todo/todo_item.dart';
import 'package:dairy_web/todo/todo_data.dart';
import 'package:dairy_web/firebase_behavior.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
/// [MainApp] used!
main() async {
  await initPolymer();
}
