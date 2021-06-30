import 'dart:ui';
import "dart:math";
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/listmodel.dart';
import 'package:flutter_todo/models/taskmodel.dart';
import 'package:flutter_todo/hiveservice.dart' as hiveService;

class TodoListitems extends StatefulWidget {
  @override
  _TodoListitemsState createState() => _TodoListitemsState();
}

class _TodoListitemsState extends State<TodoListitems> {
  makeLists() async {
    var todo = ToDoList(name: 'math', tasks: [
      Task(name: 'buch lesen', checked: false),
      Task(name: 'Arbeitsblatt', checked: false)
    ]);
    await hiveService.HiveService().saveList('School', todo);
    toDoLists = await hiveService.HiveService().getLists('School');
    print(toDoLists.toString());
  }

  var toDoLists = [];

  _TodoListitemsState() {
    makeLists();
  }

  List<String> listobjects = [
    'Beispiel1',
    'Beispiel2',
    'Beispiel3',
    'Beispiel4',
  ];

  void addListitem(String listitem) {
    setState(() {
      listobjects.add(listitem);
    });
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: getColor(),
                child: Center(
                  child: ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: 6.0, top: 60.0, left: 30.0, right: 30.0),
                      itemCount: toDoLists[0].tasks.length,
                      itemBuilder: (context, i) {
                        return Listrows(toDoLists[0].tasks[i].name);
                      }),
                ))));
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
                          color: Colors.black.withOpacity(0.15), blurRadius: 25)
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
                            value: false,
                            onChanged: (bool? value) {},
                          )),
                      title: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
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
        TextField(),
        Text(inputtext),
      ],
    );
  }
}
