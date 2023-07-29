import 'package:flutter/material.dart';
import 'presentation/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Post It',
      theme: _buildTheme(Brightness.dark),
      home: const Home(),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
        // textTheme: GoogleFonts.kleeOneTextTheme(baseTheme.textTheme),
        // textTheme: GoogleFonts.architectsDaughterTextTheme(baseTheme.textTheme),
        // textTheme: GoogleFonts.yomogiTextTheme(baseTheme.textTheme),
        // textTheme: GoogleFonts.comingSoonTextTheme(baseTheme.textTheme),
        );
  }
}
