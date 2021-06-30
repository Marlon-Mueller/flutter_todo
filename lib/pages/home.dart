import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../components/carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ToDoCarousel(),
    );
  }
}
