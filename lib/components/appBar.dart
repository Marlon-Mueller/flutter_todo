import 'package:flutter/material.dart';

//Klasse enthält die AppBar
class Bar extends StatelessWidget {
  Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(82, 82, 82, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: _buildButtonColumn(Color.fromRGBO(255, 255, 255, 1),
                    Icons.notifications_sharp),
                onPressed: () {},
              ),
              /*IconButton(
                icon: _buildButtonColumn(
                    Color.fromRGBO(255, 255, 255, 1), Icons.search),
                onPressed: () {},
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon) {
    //Eine Funktion um Icons zu erstellen
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Icon(icon, color: color, size: 20),
        ),
      ],
    );
  }
}
