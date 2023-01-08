import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(App());
}

// make stateful widget
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

// make state
class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

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
      home: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? MyLargeTitle() : Text("nothing"),
              IconButton(
                onPressed: toggleTitle,
                icon: Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color, // ! is not null
      ),
    );
  }
}
