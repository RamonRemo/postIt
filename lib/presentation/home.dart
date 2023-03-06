import 'package:animated_post_it/models/post_it_entity.dart';
import 'package:animated_post_it/presentation/custom_rect_tween.dart';
import 'package:animated_post_it/presentation/hero_dialog_route.dart';
import 'package:animated_post_it/presentation/home_controller.dart';
import 'package:animated_post_it/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/todo_add_card.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    var size = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        _backGround(),
        _bodyAndButton(context, size),
      ],
    );
  }

  Center _bodyAndButton(context, double size) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Stack(children: [
          _content(size),
          _button(context),
        ]),
      ),
    );
  }

  Container _content(double size) {
    return Container(
      padding: const EdgeInsets.all(9),
      // color: Colors.red,
      child: MasonryGridView.count(
        crossAxisCount: size > 650 ? 3 : 2,
        mainAxisSpacing: 9,
        crossAxisSpacing: 9,
        itemCount: controller.list.length,
        itemBuilder: (context, index) {
          final item = controller.list[index];

          return CustomTile(
            title: item.title,
            description: item.description,
          );
        },
      ),
    );
  }

  _button(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (_) {
                  return TodoAddCard(
                    onAdd: (PostItEntity entity) {
                      setState(() {
                        controller.list.add(entity);
                        Navigator.pop(context);
                      });
                    },
                  );
                },
              ),
            );
          },
          child: Hero(
            tag: 'button',
            createRectTween: (begin, end) {
              return CustomRectTween(begin: begin!, end: end!);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _backGround() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF191B1C),
            Color(0xFF191D1F),
          ],
          stops: [0.0, 1],
        ),
      ),
    );
  }
}
