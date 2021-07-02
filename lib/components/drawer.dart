import 'dart:ui';
import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/calender.dart';
import 'package:flutter_todo/pages/home.dart';


class ToDoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Color.fromRGBO(85, 85, 85, 1),
        ),
        drawer: Drawer(
            child: Container(
                color: Color.fromRGBO(82, 82, 82, 1),
                width: width,
                height: height + 50,
                padding: const EdgeInsets.only(top: 45.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 10.0),
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
                          hoverColor: Colors.lightGreen,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            hoverColor: Colors.lightGreen,
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
                          hoverColor: Colors.lightGreen,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                DropdownInDrawer(),
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
                ))));
  }
}

//Dropdown Menü
class DropdownInDrawer extends StatefulWidget {
  const DropdownInDrawer({Key? key}) : super(key: key);

  @override
  State<DropdownInDrawer> createState() => _DropdownInDrawerState();
}

class _DropdownInDrawerState extends State<DropdownInDrawer> {
  String dropdownValue = 'Schule';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Color.fromRGBO(255, 255, 255, 1),
      value: dropdownValue,
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
          /*Navigator.of(context).pop();
          Navigator.pushNamed(
            context,
            ExtractArgumentsScreen.routeName,
            arguments: ScreenArguments(
              newValue,
            ),
          );*/
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
