import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/components/carousel.dart';
import 'package:flutter_todo/pages/ToDo.dart';
import 'package:flutter_todo/pages/home.dart';
import '../pages/home.dart';
import '../pages/calender.dart';

class ToDoDrawer extends StatelessWidget {
  final String category;
  const ToDoDrawer(this.category);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(category),
          backgroundColor: Color.fromRGBO(85, 85, 85, 1),
        ),
        drawer: Drawer(
          child: Container(
              color: Color.fromRGBO(82, 82, 82, 1),
              width: width,
              height: height + 50,
              padding: const EdgeInsets.only(top: 45.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Checklistenmenü",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text("Kalender "),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                  size: 15,
                                )
                              ],
                            )),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Calenderpage()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Checkliste "),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.check_sharp,
                                    color: Colors.black,
                                    size: 15,
                                  )
                                ],
                              )),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Home()), //öffnen der Checkleiste
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 38,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              DropdownInDrawer(category: category),
                            ],
                          ),
                        ),
                      ),
                      /*width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                          height: 40,
                          //padding: const EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                DropdownInDrawer(),
                              ]),
                        ),*/
                    ),
                  ],
                ),
              )),
        ),
        body: Container(
          child: ToDoCarousel(
            category: category,
          ),
          margin: const EdgeInsets.only(top: 110.0),
        ));
  }
}

//Dropdown Menü
class DropdownInDrawer extends StatefulWidget {
  final String category;
  const DropdownInDrawer({Key? key, required this.category}) : super(key: key);

  @override
  State<DropdownInDrawer> createState() => _DropdownInDrawerState();
}

class _DropdownInDrawerState extends State<DropdownInDrawer> {
  String dropdownValue = 'Schule';
  late String category;

  @override
  void initState() {
    super.initState();
    category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Color.fromRGBO(255, 255, 255, 1),
      value: category,
      icon: const Icon(Icons.format_list_bulleted_sharp, color: Colors.black),
      iconSize: 15,
      //elevation: 16,
      style: const TextStyle(
        color: Colors.black,
      ),
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          Navigator.of(context).pop();
          Navigator.pushNamed(
            context,
            ToDoScreen.routeName,
            arguments: SelectedCategory(
              newValue,
            ),
          );
        });
      },
      items: <String>['Schule', 'Arbeit', 'Freizeit', 'Haushalt']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(
            child: Text(
              value,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class SelectedCategory {
  final String category;

  SelectedCategory(this.category);
}
