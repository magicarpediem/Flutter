import 'package:counter/data/settings.dart';
import 'package:counter/screens/main_screen.dart';
import 'package:counter/util/constants.dart';
import 'package:counter/util/settings_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  Settings settings = Settings();

  @override
  Widget build(BuildContext context) {
    return SettingsProvider(
      settings: settings,
      child: MaterialApp(
        title: 'Counter',
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
              button: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              headline6: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              subtitle1: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              bodyText1: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              bodyText2: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              caption: TextStyle(
                color: Colors.white,
              )),
          scaffoldBackgroundColor: kBgColor,
        ),
        home: MainScreen(title: 'Simple Counter'),
      ),
    );
  }
}
