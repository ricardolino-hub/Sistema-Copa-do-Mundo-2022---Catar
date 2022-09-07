import 'package:flutter/material.dart';


class LogMatchups extends StatelessWidget {
  const LogMatchups({Key? key, required this.logs}) : super(key: key);
  final List<dynamic> logs;
  @override
  Widget build(BuildContext context) {
    print(logs.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copa do Mundo 2022 - Jogadas'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 170, 3, 47),
      ),
    );
  }
}