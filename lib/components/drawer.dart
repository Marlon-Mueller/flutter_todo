import 'dart:ui';
import 'package:flutter/material.dart';

import '../pages/home.dart';

class ToDoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
            color: Color.fromRGBO(82, 82, 82, 1),
            width: width,
            height: height + 50,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.arrow_drop_up_sharp,
                    color: Colors.black,
                    size: 15,
                  ),
                  Text(
                    "Checklistenmenü",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Kalender "),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 15,
                              )
                            ],
                          )),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 2.5,
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
                                Text("Checkliste "),
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
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
                    height: 5,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      height: 40,
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            DropdownInDrawer(),
                          ]),
                    ),
                  ),
                ],
              ),
            )));
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
      icon: const Icon(Icons.arrow_downward, color: Colors.black),
      iconSize: 15,
      elevation: 16,
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
            Home.routeName,
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
