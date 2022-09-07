import 'package:flutter/material.dart';
import 'drawer/drawer.dart';
import 'homeScreens/matchupCalender.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copa do Mundo 2022 - Catar'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 170, 3, 47),
      ),
      drawer: createDrawer(context),
      body: MatchupCalender(),
    );
  }
}