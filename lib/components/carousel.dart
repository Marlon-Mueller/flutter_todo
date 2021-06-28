import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _Carousel createState() => _Carousel();
}

class _Carousel extends State<Carousel> {
  final slider = CarouselSlider(
    items: <Widget>[],
    options: CarouselOptions(height: 400),
  );
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
