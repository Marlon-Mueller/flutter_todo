import 'dart:math';

import 'package:flutter/material.dart';
import "dart:math";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_todo/components/listitems.dart';
import 'package:flutter_todo/models/listmodel.dart';
import './listitems.dart';
import 'package:flutter_todo/hiveservice.dart';

Future<List<ToDoList>> getHiveData() async {
  return await HiveService().getLists('School');
}

class ToDoCarousel extends StatefulWidget {
  const ToDoCarousel({Key? key}) : super(key: key);

  @override
  _ToDoCarousel createState() => _ToDoCarousel();
}

class _ToDoCarousel extends State<ToDoCarousel> {
  var cards = <Widget>[];
  var slider;
  var toDoList;
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<ToDoList>>(
          future: getHiveData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CarouselSlider(
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
                            Container(child: TodoListitems(toDoList: item)),
                          ]),
                        ),
                      );
                    });
                  }).toList(),
                  options: CarouselOptions(
                      height: 500,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          }),
    );
  }
}
