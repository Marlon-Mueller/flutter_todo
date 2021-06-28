import 'package:flutter/material.dart';
import '../components/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: Stack(children: [
      Positioned(
          bottom: -(MediaQuery.of(context).size.height / 3),
          left: 0,
          child: ToDoDrawer()),
    ])));
  }
}
