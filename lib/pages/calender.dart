import 'package:flutter/material.dart';
import 'package:flutter_todo/components/drawer.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:table_calendar/table_calendar.dart';

class Calenderpage extends StatefulWidget {
  @override
  _CalenderpageState createState() => _CalenderpageState();
}

class _CalenderpageState extends State<Calenderpage> {
  final String category = 'Schule';
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Kalender'),
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
                    ),
                  ],
                ),
              )),
        ),
        body: Column(children: [
          TableCalendar(
            locale: "de_DE",
            firstDay: DateTime.utc(1970, 2, 10),
            lastDay: DateTime.utc(2100, 2, 10),
            focusedDay: DateTime.now(),
            calendarFormat: _calendarFormat,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                focusedDay = focusDay;
                selectedDay = selectDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100.0, right: 0.0),
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
                        builder: (BuildContext context) => new Home()));
              },
            ),
          ),
        ]));
  }
}
