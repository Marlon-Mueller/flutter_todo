import 'package:flutter/material.dart';
import 'package:flutter_todo/components/appBar.dart';
import 'package:flutter_todo/components/drawer.dart';
import 'package:hive/hive.dart';
import '../components/carousel.dart';

class ToDoScreen extends StatefulWidget {
  static const routeName = '/Category';
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  ToDoScreenState createState() => ToDoScreenState();
}

class ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    SelectedCategory args =
        ModalRoute.of(context)!.settings.arguments as SelectedCategory;
    return Container(
        child: Container(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.antiAlias,
          children: <Widget>[
            ToDoDrawer(args.category),
            Bar(),
          ],
        ),
      ),
    ));
  }
}
