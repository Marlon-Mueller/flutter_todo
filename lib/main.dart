import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/listmodel.dart';
import 'package:flutter_todo/models/taskmodel.dart';
import 'pages/ToDo.dart';
import 'components/listitems.dart';
import 'pages/home.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './hiveservice.dart';

void main() async {
  //Initialize Hive database
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoListAdapter());
  Hive.registerAdapter(TaskAdapter());

  /* await Hive.openBox<ToDoList>('Schule');
  await Hive.openBox<ToDoList>('Arbeit');
  await Hive.openBox<ToDoList>('Freizeit');
  await Hive.openBox<ToDoList>('Haushalt'); */

  var todoS = ToDoList(name: 'Mathe', tasks: []);
  var todoS2 = ToDoList(name: 'Physik', tasks: []);
  var todoS3 = ToDoList(name: 'Deutsch', tasks: []);

  var todo = ToDoList(name: '', tasks: []);
  var todo2 = ToDoList(name: 'Physik', tasks: []);
  var todo3 = ToDoList(name: 'Deutsch', tasks: []);

  await HiveService().saveList('Schule', todoS);
  await HiveService().saveList('Schule', todoS2);
  await HiveService().saveList('Schule', todoS3);

  await HiveService().saveList('Schule', todoS);
  await HiveService().saveList('Schule', todoS2);
  await HiveService().saveList('Schule', todoS3);

  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        ToDoScreen.routeName: (context) => ToDoScreen(),
      },
    );
  }
}
