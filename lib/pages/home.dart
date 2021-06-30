import 'dart:ui';

import 'package:flutter/material.dart';
import '../components/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showfulldrawer = false;
  @override
  Widget build(BuildContext context) {
    var holdmenu = 60;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
        child: Scaffold(
            body: GestureDetector(
                onTap: () {
                  showfulldrawer = true;
                },
                child: Container(
                    child: Stack(children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: Colors.black.withOpacity(0.15)),
                  ),
                  AnimatedPositioned(
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 200),
                      bottom: (showfulldrawer)
                          ? -50
                          : -(MediaQuery.of(context).size.height / 3),
                      left: 0,
                      child: ToDoDrawer()),
                ])))));
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