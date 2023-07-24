import "package:flutter/material.dart";


class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title:  Text('Updates'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
            'Stay Updated with the Latest App Features!\n\n'
            'We are constantly improving our Stock Prediction App to provide you with the best experience. Our regular updates include bug fixes, performance enhancements, and exciting new features to enhance your trading journey.\n\n'
            'Key Features of Updates:\n'
            '- Release notes with detailed updates\n'
            '- User-friendly interface enhancements\n'
            '- Faster and more accurate predictions\n'
            '- Improved watchlist and portfolio management\n'
            '- Enhanced data visualization and analysis tools\n\n'
            'At [App Name], we value your feedback and strive to deliver a seamless and reliable app. We are dedicated to continuously evolving with the ever-changing market dynamics, making sure you have the tools to thrive in your investment endeavors.\n\n'
            'Happy trading!',
            textAlign: TextAlign.center,
            ),
          ),
        ),
    );
  }
}


       
        
     