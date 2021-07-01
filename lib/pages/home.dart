import 'dart:ui';

import 'package:flutter/material.dart';
import '../components/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.category),
      ),
      body: Center(
        child: Text(args.category),
      ),
    );
  }
}

/*          onPanEnd: (details) {
                  if (details.velocity.pixelsPerSecond.dy > holdmenu) {
                    this.setState(() {
                      showfulldrawer = false;
                    });
                  } else if (details.velocity.pixelsPerSecond.dy < -holdmenu) {
                    this.setState(() {
                      showfulldrawer = true;
                    });
                  }*/