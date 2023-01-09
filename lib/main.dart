import 'package:flutter/material.dart';
import 'package:toons/screens/home_screen.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  // key is required for stateful widgets to be able to rebuild ( it's a unique identifier )
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: HomeScreen(),
    ));
  }
}
