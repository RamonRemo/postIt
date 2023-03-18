import 'package:animated_post_it/models/post_it_entity.dart';
import 'package:animated_post_it/presentation/home.dart';
import 'package:flutter/material.dart';

class HomeController {
  static final HomeController _instance = HomeController._internal();

  factory HomeController() => _instance;

  HomeController._internal();

  List<PostItEntity> list = [
    PostItEntity(
      title: 'teste 1',
      description: '123456789-123456789-123456789-123456789',
      hero: Home.heroGiver(),
    ),
  ];

  List<Color> particleColors = [Colors.blueGrey[500]!, Colors.green];
}
