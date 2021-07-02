import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_todo/components/listitems.dart';
import 'package:flutter_todo/models/listmodel.dart';
import 'package:flutter_todo/models/taskmodel.dart';
import './listitems.dart';
import 'package:flutter_todo/hiveservice.dart';

Future<List<ToDoList>> getHiveData(String category) async {
  return await HiveService().getLists(category);
}

class ToDoCarousel extends StatefulWidget {
  final String category;
  const ToDoCarousel({Key? key, required this.category}) : super(key: key);

  @override
  _ToDoCarousel createState() => _ToDoCarousel();
}

class _ToDoCarousel extends State<ToDoCarousel> {
  var cards = <Widget>[];
  var slider;
  var toDoList;
  late String category;

  @override
  void initState() {
    super.initState();
    category = widget.category;
  }

  final colors = [
    Color.fromRGBO(255, 107, 178, 1),
    Color.fromRGBO(171, 215, 99, 1),
    Color.fromRGBO(118, 208, 227, 1),
    Color.fromRGBO(159, 107, 255, 1)
  ];

  getColor() {
    var _random = new Random();
    var color = colors[_random.nextInt(colors.length)];
    return color;
  }

  addList(String name, String a1, String a2) async {
    ToDoList newList = ToDoList(name: name, tasks: [
      Task(name: a1, checked: false),
      Task(name: a2, checked: false)
    ]);

    await HiveService().saveList(category, newList);
    setState(() {});
  }

  void pushEntry() {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      /* minimumSize: Size(_width, _height), */
      backgroundColor: Colors.white,
      padding: EdgeInsets.all(0),
    );

    String title = '';
    String a1 = '';
    String a2 = '';

    Widget okButton = TextButton(
      style: flatButtonStyle,
      child: Text("Hinzufügen"),
      onPressed: () {
        Navigator.pop(context);
        addList(title, a1, a2);
      },
    );

    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Liste Hinzufügen'),
            content: Row(
              children: [
                Text('Titel'),
                TextField(
                  onChanged: (value) => title = value,
                ),
                Text('Aufgabe 1'),
                TextField(
                  onChanged: (value) => a1 = value,
                ),
                Text('Aufgabe 2'),
                TextField(
                  onChanged: (value) => a2 = value,
                ),
              ],
            ),
            actions: [okButton],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<ToDoList>>(
          future: getHiveData(category),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(children: [
                CarouselSlider(
                    items: snapshot.data!.map((item) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Stack(children: [
                              Text(item.name),
                              Container(
                                  child: TodoListitems(
                                      toDoList: item, category: category)),
                            ]),
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        height: 500,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false)),
                MaterialButton(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Liste hinzufügen",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                  onPressed: () => pushEntry(),
                ),
              ]);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          }),
    );
  }
}
