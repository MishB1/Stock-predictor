import 'package:flutter/material.dart';
import 'screens/homeScreen/homeScreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Predictor',
      initialRoute: homeScreen.routeName,
      routes: {        
        homeScreen.routeName: (context) => const homeScreen(),
        //Splash.routeName: (context) => const Splash(),
        //LoginOptions.routeName: (context) => const LoginOptions(),
       // Calpager.routeName: (context) => const Calpager(),       
      },
    );
  }
}