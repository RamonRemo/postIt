import 'package:flutter/material.dart';

class PostItEntity extends StatelessWidget {
  final String title;
  final String description;
  final int hero;
  final Color? color;

  const PostItEntity({
    super.key,
    required this.title,
    required this.description,
    required this.hero,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
