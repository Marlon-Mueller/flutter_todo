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
   var todo = ToDoList(name: 'Mathe', tasks: []);
  var todo2 = ToDoList(name: 'Physik', tasks: []);
  var todo3 = ToDoList(name: 'Deutsch', tasks: []);
  
  var todo01 = ToDoList(name: 'Termine', tasks: []);
  var todo21 = ToDoList(name: 'Arbeit', tasks: []);
  
  var todo02 = ToDoList(name: 'Sport', tasks: []);

  
  var todo03 = ToDoList(name: 'Kochen', tasks: []);
  var todo23 = ToDoList(name: 'Waschen', tasks: []);
  var todo33 = ToDoList(name: 'Garten', tasks: []);

  await HiveService().saveList('Schule', todo);
  await HiveService().saveList('Schule', todo2);
  await HiveService().saveList('Schule', todo3);
  
  await HiveService().saveList('Arbeit', todo01);
  await HiveService().saveList('Arbeit', todo21);
  
  await HiveService().saveList('Freizeit', todo02);
  
  await HiveService().saveList('Haushalt', todo03);
  await HiveService().saveList('Haushalt', todo23);
  await HiveService().saveList('Haushalt', todo33);

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
