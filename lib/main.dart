import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Homepage(),
  )
);

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black, 
    ); 
  }
  
}

