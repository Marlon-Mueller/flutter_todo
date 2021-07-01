import 'package:flutter/material.dart';
import 'package:flutter_todo/components/drawer.dart';
import 'package:hive/hive.dart';
import '../components/carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/Category';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
  /*
  void showCategory() {
    SelectedCategory args =
        ModalRoute.of(context)!.settings.arguments as SelectedCategory;
    bool isNewRouteSameAsCurrent = false;

    Navigator.popUntil(context, (route) {
      if (route.settings.name == Home.routeName) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });

    if (!isNewRouteSameAsCurrent) {
      Navigator.pushNamed(context, Home.routeName);
      @override
      Widget build(BuildContext context) {
        // Text(args.category)
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: ToDoCarousel(),
            ),
            Container(child: Text(args.category)),
          ],
        );
        /*return Container(
            child: ToDoCarousel(),
        );*/
      }
    }
  }

  Column initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => showCategory());
  }*/

  @override
  Widget build(BuildContext context) {
    SelectedCategory args =
        ModalRoute.of(context)!.settings.arguments as SelectedCategory;
    //Text(args.category);
    var category;
    category = args.category;
    if (args.category == '') {
      category = SelectedCategory('Schule');
    }

    return Row(
      children: [
        Container(
          child: ToDoCarousel(),
        ),
        Container(child: Text(category)),
      ],
    );

    /*return Container(
      child: ToDoCarousel(),
    );*/
  }
}
