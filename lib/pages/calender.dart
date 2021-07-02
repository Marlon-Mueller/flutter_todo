import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:table_calendar/table_calendar.dart';

class Calenderpage extends StatefulWidget {
  @override
  _CalenderpageState createState() => _CalenderpageState();
}

class _CalenderpageState extends State<Calenderpage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kalender'),
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
