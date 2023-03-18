import 'package:animated_post_it/presentation/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

class CustomAnimatedBackground extends StatefulWidget {
  const CustomAnimatedBackground({super.key});

  @override
  State<CustomAnimatedBackground> createState() =>
      _CustomAnimatedBackgroundState();
}

class _CustomAnimatedBackgroundState extends State<CustomAnimatedBackground>
    with TickerProviderStateMixin {
  final controller = HomeController();

  var particlePaint = Paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;

  late ParticleOptions particleOptions = ParticleOptions(
    colors: controller.particleColors,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.15,
    minOpacity: 0.1,
    maxOpacity: 0.6,
    spawnMinSpeed: 3.5,
    spawnMaxSpeed: 7.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 40,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
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
      ),
      AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: particleOptions,
          paint: particlePaint,
        ),
        vsync: this,
        child: Container(),
      ),
    ]);
  }
}
