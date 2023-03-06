import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String description;
  double linhas = 4.0;

  CustomTile({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // final size = getTextSize(context);

    return Container(
      padding: const EdgeInsets.all(35),
      // height: size,
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
    );
  }

  // getTextSize(context) {
  //   var size = MediaQuery.of(context).size.width;

  //   var a = 1000;
  //   var b = 22;
  //   var c = size;
  //   var charPerLine = 0.0;

  //   charPerLine = (c * b) / a;

  //   linhas = (description.trim().length / charPerLine);

  //   if (linhas < 4) {
  //     return 200.0;
  //   }
  // }

  TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
}
