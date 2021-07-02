import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/listmodel.dart';
import 'package:flutter_todo/models/taskmodel.dart';
import 'components/listitems.dart';
import 'pages/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './hiveservice.dart';

void main() async {
  //Initialize Hive database
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoListAdapter());
  Hive.registerAdapter(TaskAdapter());

  /* await Hive.openBox<ToDoList>('School');
  await Hive.openBox<ToDoList>('Work');
  await Hive.openBox<ToDoList>('Freetime');
  await Hive.openBox<ToDoList>('Household'); */

  var todo = ToDoList(name: 'Mathe', tasks: []);

  var todo2 = ToDoList(name: 'Physik', tasks: []);

  var todo3 = ToDoList(name: 'Deutsch', tasks: []);

  await HiveService().saveList('School', todo);
  await HiveService().saveList('School', todo2);
  await HiveService().saveList('School', todo3);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
