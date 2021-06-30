import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
    );
  }
}
