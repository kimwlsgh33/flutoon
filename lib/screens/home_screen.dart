import 'package:flutter/material.dart';
import 'package:toons/models/webtoon_model.dart';
import 'package:toons/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool loading = true;

  void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebToons();
    // if execute setState function here, you can't wait api data
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(loading);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Toons',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0,
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
