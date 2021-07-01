import 'package:flutter/material.dart';
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
                          child: Container(
                            child: TodoListitems(toDoList: item),
                          ),
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
