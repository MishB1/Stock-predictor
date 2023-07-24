import 'package:flutter/material.dart';
import 'package:stock_predictor/screens/splashScreen/splashscreen.dart';
import 'screens/HomeScreen/homeScreen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Predictor',
      initialRoute: homeScreen.routeName,
      routes: {  
        splashScreen.routeName: (context) => const splashScreen(),      
        homeScreen.routeName: (context) => const homeScreen(),
        //LoginOptions.routeName: (context) => const LoginOptions(),
       // Calpager.routeName: (context) => const Calpager(),       
      },
    );
  }
}