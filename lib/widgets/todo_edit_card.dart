// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_post_it/models/post_it_entity.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:animated_post_it/presentation/custom_rect_tween.dart';

class TodoEditCard extends StatelessWidget {
  final Function(PostItEntity) onEdit;
  final PostItEntity entity;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  TodoEditCard({
    Key? key,
    required this.onEdit,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: entity.hero,
      createRectTween: (begin, end) {
        return CustomRectTween(begin: begin!, end: end!);
      },
      flightShuttleBuilder: (flightContext, animation, flightDirection,
          fromHeroContext, toHeroContext) {
        return Center(
          child: Container(
            height: 300,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      },
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(25),
            height: 300,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              borderRadius: BorderRadius.circular(30),
            ),
            child: buildCard(context),
          ),
        ),
      ),
    );
  }

  Column buildCard(BuildContext context) {
    return Column(
      children: [
        _buildTitle(),
        _buildTextField(),
        _buildButton(context),
      ],
    );
  }

  TextButton _buildButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (titleController.text.isEmpty || descController.text.isEmpty) {
          const snackBar = SnackBar(
            content: Text('Cant be Empty'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }

        final model = PostItEntity(
          title: titleController.text,
          description: descController.text,
          hero: entity.hero,
        );

        onEdit(model);
      },
      child: const Text(
        'Add',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Expanded _buildTextField() {
    descController.text = entity.description;
    return Expanded(
      child: TextFormField(
        onEditingComplete: () {
          print('text');
        },
        onFieldSubmitted: (text) {
          print(text);
        },
        controller: descController,
        style: const TextStyle(
          color: Colors.white,
        ),
        maxLines: 20,
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          hintText: 'Write Something...',
          border: InputBorder.none,
        ),
      ),
    );
  }

  TextField _buildTitle() {
    titleController.text = entity.title;

    return TextField(
      // autofocus: kIsWeb,
      controller: titleController,
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        hintText: 'New Todo',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
