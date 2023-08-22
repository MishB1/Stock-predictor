import "package:flutter/material.dart";

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('News'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Stay Informed with the Latest News!\n\n'
            'Our Stock Prediction App brings you up-to-date news about the companies and industries you care about. We curate relevant and timely articles, so you can make informed decisions and stay ahead of the curve.\n\n'
            'Key Features of News:\n'
            '- Breaking news and market updates\n'
            '- In-depth analysis from financial experts\n'
            '- Company earnings and announcements\n'
            '- Trends and insights to guide your investments\n'
            '- Customizable news categories for personalized updates\n\n'
            'With our comprehensive news coverage and accurate predictions, you will have a well-rounded view of the market and be equipped to navigate it successfully.\n\n'
            'Happy trading!',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
