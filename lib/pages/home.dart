import 'package:flutter/material.dart';
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
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Scaffold(
          drawer: ToDoDrawer(),
          body: Stack(
            clipBehavior: Clip.antiAlias,
            children: <Widget>[
              ToDoDrawer(),
              Bar(),
            ],
          ),
        ),
      ),
    );
  }
}

/*return Container(
      child: Scaffold(
        drawer: ToDoDrawer(),
        body: Row(children: [
          ToDoCarousel(),
          Bar(),
        ]),
      ),
    );

    return Container(
      child: ToDoCarousel(),
    );
  }
}*/
