import 'package:flutter/material.dart';
import 'package:toons/screens/home_screen.dart';

void main(List<String> args) {
  runApp(App());
}

// make stateful widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
