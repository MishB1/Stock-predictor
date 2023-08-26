import "package:flutter/material.dart";

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Notifications'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'Stay Updated with Notifications!\n\n'
          'Receive real-time updates about your favorite stocks, market trends, and investment opportunities. Our Stock Prediction App ensures you never miss a beat, keeping you informed of crucial developments that impact your portfolio.\n\n'
          'Key Features of Notifications:\n'
          '- Personalized alerts for selected stocks\n'
          '- Price threshold notifications\n'
          '- Market analysis and insights\n'
          '- News alerts for your investments\n'
          '- Timely reminders to monitor stocks\n\n'
          'With our user-friendly interface and accurate predictions, we strive to deliver a seamless experience, empowering you to make well-informed decisions. Optimize your trading strategy with our intuitive notification system!\n\n'
          'Happy trading!',
        ),
      ),
    );
  }
}
