import 'package:flutter/material.dart';
import 'package:stock_predictor/auth/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Auth(),
      debugShowCheckedModeBanner: false,
      title: 'Stock Predictor',
    );
  }
}
