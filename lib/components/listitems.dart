import 'dart:ui';
import "dart:math";
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_todo/models/listmodel.dart';

class TodoListitems extends StatefulWidget {
  final ToDoList toDoList;

  const TodoListitems({Key? key, required this.toDoList}) : super(key: key);

  @override
  _TodoListitemsState createState() => _TodoListitemsState();
}

class _TodoListitemsState extends State<TodoListitems> {
  late ToDoList toDoList;
  var cardContent = <Widget>[];
  @override
  void initState() {
    super.initState();
    toDoList = widget.toDoList;
    /* toDoLists = makeLists();
    makeLists().then((data) => addCardData(data)); */
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

  void pushEntry() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: getColor(),
                child: Stack(children: [
                  Center(
                    child: ListView.builder(
                        padding: EdgeInsets.only(
                            bottom: 6.0, top: 60.0, left: 30.0, right: 30.0),
                        itemCount: toDoList.tasks.length,
                        itemBuilder: (context, i) {
                          return Container(
                              child: Stack(children: [
                            /* Inputfield(), */
                            Listrows(toDoList.tasks[i].name),
                          ]));
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 400.0, left: 200.0),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      onPressed: pushEntry,
                      child: Icon(Icons.add,
                          size: 25, color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                  Center(
                      child: Container(
                    margin: const EdgeInsets.only(bottom: 420),
                    child: Glassbox(
                      width: 100,
                      height: 20,
                      child: Center(
                        child: Text(
                          toDoList.name,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )),
                ]))));
  }
}

class Glassbox extends StatelessWidget {
  final double width, height;
  final Widget child;

  const Glassbox(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 250,
          height: height,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7.0,
                  sigmaY: 7.0,
                ),
                child: Container(
                  width: width,
                  height: height,
                  child: new Text(""),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10), blurRadius: 25)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.0025),
                          Colors.white.withOpacity(0.0015),
                        ],
                        stops: [
                          0.0,
                          1.0
                        ])),
                child: child,
              )
            ],
          ),
        ));
  }
}

class Listrows extends StatelessWidget {
  final String title;
  const Listrows(this.title);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double xWidth = size.width * 0.40;
    double xHeight = size.height * 0.06;
    var between = SizedBox(
      height: 70,
    );
    return Container(
      child: SizedBox(
        height: 55,
        child: Stack(
          children: [
            between,
            between,
            Glassbox(
                width: xWidth,
                height: xHeight,
                child: Center(
                  child: ListView(children: [
                    ListTile(
                      leading: Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor:
                                Colors.white.withOpacity(0.5),
                          ),
                          child: Checkbox(
                            value: true,
                            onChanged: (bool? value) {},
                          )),
                      title: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 20,
                        ),
                      ),
                      trailing: Icon(
                        Icons.delete_outline,
                        size: 25,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}

class Inputfield extends StatefulWidget {
  @override
  _InputfieldState createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
  void updatefield(String textupdate) {
    setState(() {
      inputtext = textupdate;
    });
  }

  String inputtext = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onSubmitted: updatefield,
        ),
        Text(inputtext),
      ],
    );
  }
}
