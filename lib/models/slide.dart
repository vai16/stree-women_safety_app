import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/sos.jpg',
    title: 'Easy SOS Feature',
    description: 'Inform Family & Friends for Help!',
  ),
  Slide(
    imageUrl: 'assets/images/fakecallicon.jpg',
    title: 'Fake Call',
    description: 'Get a Fake call with just One Click!',
  ),
  Slide(
    imageUrl: 'assets/images/tipstricks.jpg',
    title: 'Tips and Tricks',
    description: 'Learn Tips & Tricks to ensure your Safety!',
  ),
];
