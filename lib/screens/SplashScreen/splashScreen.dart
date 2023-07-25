import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  static const String routeName = '/splashScreen';

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