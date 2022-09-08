import 'package:flutter/material.dart';
import 'playersScreen.dart';
import '../api/api.dart';

Widget createDrawer(context){
  return Drawer(
    child: FutureBuilder(
      future: Api.getTeamsAndPlayers(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            const Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.builder( 
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return ListTile(
                    // textColor: const Color.fromARGB(255, 170, 3, 47),
                    leading: const Icon(Icons.sports_soccer_sharp, color: Color.fromARGB(255, 170, 3, 47),),
                    title: Text(snapshot.data![index]["name_team"]),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                        builder: (context) => Players(players: snapshot.data![index]["players"], nameTeam: snapshot.data![index]["name_team"],)
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
