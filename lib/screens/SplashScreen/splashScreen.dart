import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  static const String routeName = '/splashScreen';
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          scrollDirection:  Axis.horizontal,
          children: List.generate(
            5, 
            (i) => Image.asset(
               "assets/images/splash$i",
               fit: BoxFit.cover,
               alignment: Alignment.center,
            )
          ),
        )
      ],
    );
  }
}