// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:animated_post_it/presentation/custom_rect_tween.dart';

class TodoCard extends StatefulWidget {
  final String title;
  final String description;
  final int? heroTag;
  final Function()? onTap;
  final Function()? onDelete;
  final Color? color;

  TodoCard({
    Key? key,
    required this.title,
    required this.description,
    this.heroTag,
    this.onTap,
    this.color,
    this.onDelete,
  }) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  final TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  bool isHovering = false;
  bool isHoveringIcon = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.heroTag ?? '',
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin!, end: end!);
      },
      child: Stack(
        children: [
          InkWell(
            onHover: (value) {
              print('IsHove');

              setState(() {
                isHovering = value;
              });
            },
            onTap: widget.onTap,
            child: PhysicalModel(
              color: Colors.black,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(15),
              shadowColor: Colors.black,
              child: Container(
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  // color: Color(0xFF1F2426),
                  color: widget.color ?? Colors.blueGrey[900],

                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.title,
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
                      widget.description,
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: shoudlAppear(),
            child: InkWell(
              onHover: (value) {
                print('icon');
                isHoveringIcon = value;
              },
              onTap: widget.onDelete,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.highlight_remove_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool shoudlAppear() {
    if (!kIsWeb) {
      return true;
    }

    return isHovering || isHoveringIcon;
  }
}
