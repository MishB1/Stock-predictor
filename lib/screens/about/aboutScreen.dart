import "package:flutter/material.dart";

class aboutScreen extends StatelessWidget {
  const aboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('About Us'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'Welcome to our Stock Prediction App!\n\n'
          'At MishDes Stocks, we believe in empowering investors with the tools they need to make informed decisions in the dynamic world of stock trading. Our user-friendly and cutting-edge Stock Prediction App is designed to bring you accurate and reliable predictions, ensuring you stay ahead of the market trends.\n\n'
          'With a team of expert data analysts and machine learning enthusiasts, we harness the power of advanced algorithms to analyze historical stock data, market trends, and relevant news, enabling us to provide you with valuable insights and predictions on stock price movements.\n\n'
          'Whether you are a seasoned investor or just getting started, our app offers a comprehensive and intuitive platform that caters to all levels of expertise. We are committed to delivering up-to-date information and real-time predictions to help you strategize and optimize your investment decisions.\n\n'
          'Key Features:\n'
          '- Real-time stock price predictions\n'
          '- Detailed historical stock data analysis\n'
          '- Personalized watchlists and alerts\n'
          '- News and analysis to keep you informed\n'
          '- User-friendly interface for seamless navigation\n'
          '- 24/7 customer support to assist you on your investment journey\n\n'
          'At [App Name], we prioritize accuracy, transparency, and user satisfaction. Join us today and embark on a data-driven journey towards better investment choices. Take control of your financial future with our Stock Prediction App!\n\n'
          'Happy trading!',
        ),
      ),
    );
  }
}
