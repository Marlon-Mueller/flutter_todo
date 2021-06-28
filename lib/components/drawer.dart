import 'dart:ui';
import 'package:flutter/material.dart';

import '../pages/home.dart';

class ToDoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        color: Colors.white,
        width: width,
        height: height / 3.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.arrow_drop_up_sharp,
                color: Colors.black,
                size: 15,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.red,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Kalender"),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.favorite,
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
                    color: Colors.red,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Checkliste"),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.favorite,
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
                                new Home()), //öffnen des Kalenders
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}


//simple old drawer in comment not use

/*
return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Color.fromRGBO(85, 85, 85, 1),
        ),
        drawer: Drawer(
          child: Container(
            color: Color.fromRGBO(85, 85, 85, 1),
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: Text("Marlon"),
                  accountEmail: Text("kewwmkxk@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
                ListTile(
                    title: Text(
                      "Die Checkliste",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new Home()), //öffnen des Kalenders
                      );
                    }),
                Divider(
                  color: Colors.black,
                  height: 4.0,
                )
              ],
            ),
          ),
        ),
        body: Text("Hallo"));
  }*/