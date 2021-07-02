import 'dart:ui';

import 'package:flutter/material.dart';
import '../components/drawer.dart';
import 'package:flutter_todo/components/appBar.dart';
import 'package:flutter_todo/components/drawer.dart';
import 'package:hive/hive.dart';
import '../components/carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  //static const routeName = '/Category';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showfulldrawer = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: GestureDetector(
          onTap: () {
            showfulldrawer = true;
          },
          child: Container(
              child: Stack(children: [
            ToDoDrawer(),
          ]))),
    ));
  }
}

class ScreenArguments {
  final String category;

  ScreenArguments(this.category);
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    
    return Container(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {},
          child: Container(
            child: Stack(
              children: [
                ToDoDrawer(),
                ToDoCarousel(),
                Bar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
