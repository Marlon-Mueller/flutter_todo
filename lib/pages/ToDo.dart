import 'package:flutter/material.dart';
import 'package:flutter_todo/components/appBar.dart';
import 'package:flutter_todo/components/drawer.dart';
import 'package:hive/hive.dart';
import '../components/carousel.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  ToDoScreenState createState() => ToDoScreenState();
}

class ToDoScreenState extends State<ToDoScreen> {
  static const routeName = '/Category';
  @override
  Widget build(BuildContext context) {
    SelectedCategory args =
        ModalRoute.of(context)!.settings.arguments as SelectedCategory;
    return Container(
      child: Scaffold(
        drawer: ToDoDrawer(),
        body: Row(children: [
          ToDoCarousel(),
          Bar(),
        ]),
      ),
    );
  }
}
