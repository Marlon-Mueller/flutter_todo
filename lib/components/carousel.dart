import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_todo/components/listitems.dart';
import './listitems.dart';

class ToDoCarousel extends StatefulWidget {
  const ToDoCarousel({Key? key}) : super(key: key);

  @override
  _ToDoCarousel createState() => _ToDoCarousel();
}

class _ToDoCarousel extends State<ToDoCarousel> {
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
          child: TodoListitems(),
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
