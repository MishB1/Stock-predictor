import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SharePage extends StatelessWidget {
  final String shareText = 'Check out the Stock Prediction App! 📈🚀'; // The text to share

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Share App'),
              onPressed: () {
                Share.share(shareText); // Share the text when the button is pressed
              },
            ),
          ],
        ),
      ),
    );
  }
  //I must delete this later on
  RaisedButton({required Text child, required Null Function() onPressed}) {}
}
