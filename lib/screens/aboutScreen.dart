import "package:flutter/material.dart";


class aboutScreen extends StatelessWidget {
  const aboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text('About Us'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
      ),
    );
  }
}
