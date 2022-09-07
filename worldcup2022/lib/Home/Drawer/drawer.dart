import 'package:flutter/material.dart';
import '../Players/players.dart';
import '../api/api.dart';

Widget createDrawer(context){
  return Drawer(
    child: FutureBuilder(
      future: Api.getTeamsAndPlayers(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            print('esperando');
            Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              List teamsPlayers = snapshot.data!;
              return ListView.builder( 
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return ListTile(
                    textColor: const Color.fromARGB(255, 170, 3, 47),
                    leading: const Icon(Icons.sports_soccer_sharp),
                    title: Text(snapshot.data![index]["name_team"]),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                        builder: (context) => Players(players: snapshot.data![index]["players"],)
                        )
                      );
                    },
                  );
                }
              );
            }else{
              const Center(child: CircularProgressIndicator());
            }
            break;
        }
        return const Center(child: CircularProgressIndicator());
      },
    )
  );
}
