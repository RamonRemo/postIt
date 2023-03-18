import 'package:animated_post_it/presentation/custom_rect_tween.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final int? heroTag;
  final Function()? onTap;

  final TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    this.heroTag,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag ?? '',
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin!, end: end!);
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(35),
          decoration: BoxDecoration(
            // color: Color(0xFF1F2426),
            color: Colors.blueGrey[900],
            
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  title,
                  style: textStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.0,
                  ),
                  child: Divider(
                    color: Colors.white70,
                    thickness: 1.2,
                  ),
                ),
              ),
              Text(
                description,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
