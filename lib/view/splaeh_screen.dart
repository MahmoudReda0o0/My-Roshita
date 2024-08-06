import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_roshita/constant.dart';
import 'package:my_roshita/view/home.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 2000,
        //splashTransition: SplashTransition.fadeTransition,
        //pageTransitionType: PageTransitionType.scale,
        splash: const Image(
          fit: BoxFit.contain,
          image: AssetImage('assets/m1.jpeg'),
        ),
        nextScreen: const Home(),
      ),
    );
  }
}
