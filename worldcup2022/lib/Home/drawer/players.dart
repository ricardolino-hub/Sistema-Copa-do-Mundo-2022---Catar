import 'package:flutter/material.dart';

class Players extends StatelessWidget {
  const Players({Key? key, required this.players}) : super(key: key);
  final List players;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copa do Mundo 2022 - Jogadores'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 170, 3, 47),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            title: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
              child: Text(
                players[index]["name_player"].toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
              child: Text(
                players[index]["number_player"].toString()
              ),

            ),
          );
        }
      ),
    );
  }
}