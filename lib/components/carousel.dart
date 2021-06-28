import 'package:flutter/material.dart';
import "dart:math";
import 'package:carousel_slider/carousel_slider.dart';

class ToDoCarousel extends StatefulWidget {
  const ToDoCarousel({Key? key}) : super(key: key);

  @override
  _ToDoCarousel createState() => _ToDoCarousel();
}

class _ToDoCarousel extends State<ToDoCarousel> {
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

  var cards = <Widget>[];
  var slider;

  _ToDoCarousel() {
    //Creating the cards:
    for (int i = 0; i < 5; i++) {
      var newCard = Container(
          child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          color: getColor(),
        ),
      ));
      cards.add(newCard);
    }
    //Creating the Carousel Slider:
    slider = CarouselSlider(
      items: cards,
      options: CarouselOptions(
          height: 500, enlargeCenterPage: true, enableInfiniteScroll: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: slider,
    );
  }
}
