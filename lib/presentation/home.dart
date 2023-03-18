import 'package:animated_post_it/models/post_it_entity.dart';
import 'package:animated_post_it/presentation/animated_background.dart';
import 'package:animated_post_it/presentation/custom_rect_tween.dart';
import 'package:animated_post_it/presentation/hero_dialog_route.dart';
import 'package:animated_post_it/presentation/home_controller.dart';
import 'package:animated_post_it/widgets/todo_card.dart';
import 'package:animated_post_it/widgets/todo_edit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/todo_add_card.dart';

class Home extends StatefulWidget {
  static int hero = 0;
  const Home({super.key});

  static heroGiver() {
    return Home.hero++;
  }

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
        const CustomAnimatedBackground(),
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

          return TodoCard(
            title: item.title,
            description: item.description,
            heroTag: item.hero,
            onTap: () {
              Navigator.of(context).push(
                HeroDialogRoute(
                  builder: (_) {
                    return TodoEditCard(
                      entity: PostItEntity(
                        title: item.title,
                        description: item.description,
                        hero: item.hero,
                      ),
                      onEdit: (PostItEntity entity) {
                        setState(() {
                          controller.list.removeAt(index);
                          controller.list.insert(index, entity);

                          Navigator.pop(context);
                        });
                      },
                    );
                  },
                ),
              );
            },
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
                color: Colors.blueGrey[500],
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
}
