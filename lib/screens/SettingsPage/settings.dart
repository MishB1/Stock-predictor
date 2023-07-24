import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeOn = false;

  @override
  void initState() {
    super.initState();
    _loadDarkModeSetting();
  }

  _loadDarkModeSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkModeOn = prefs.getBool('darkMode') ?? false;
    });
  }

  _toggleDarkMode(bool value) {
    setState(() {
      isDarkModeOn = value;
    });
    _saveDarkModeSetting(value);
  }

  _saveDarkModeSetting(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: isDarkModeOn,
              onChanged: _toggleDarkMode,
            ),
            Text(
              'Dark Mode',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
