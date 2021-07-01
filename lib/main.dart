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
  var todo = ToDoList(name: 'Physik', tasks: [
    Task(name: 'Buch Aufgaben 1-3', checked: false),
    Task(name: 'Arbeitsblatt nummer 3', checked: false),
    Task(name: 'dritte Aufgabe', checked: false)
  ]);
  await HiveService().saveList('School', todo);

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
