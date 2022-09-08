import 'package:flutter/material.dart';
import 'package:worldcup2022/Home/api/api.dart';
import 'package:worldcup2022/Home/models/player.dart';
import 'package:worldcup2022/Home/models/typeLog.dart';
import 'event.dart';


class LogMatchups  extends StatefulWidget {
  LogMatchups ({Key? key, required this.game}) : super(key: key);
  final Event game;

  @override
  State<LogMatchups> createState() => _LogMatchupsState();
}

class _LogMatchupsState extends State<LogMatchups > {
  List<Player> players = [];
  List<TypeLog> typeLogs = [];

  Future getInstancesPlayersAndTypeLog() async{
    await Api.getPlayers().then((listPlayers) {
      for (var player in listPlayers){
        setState(() {
          players.add(player);
        });
      }
    });

    await Api.getTypeLog().then((listTypeLog) {
      for (var typeLog in listTypeLog){
        setState(() {
          typeLogs.add(typeLog);
        });
      }
    });
  }

  @override
  void initState(){
    super.initState();
    getInstancesPlayersAndTypeLog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copa do Mundo 2022 - Jogadas'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 170, 3, 47),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
              child: Text(
                widget.game.titleEvent,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.game.logsEvent?.length,
              itemBuilder: (context, index){
                String log = 'Sem log';
                String logPlayer = '';
                TextAlign alignment = TextAlign.center;
                for (var typelog in typeLogs){
                  if(typelog.idTypeLog == widget.game.logsEvent![index]["id_log_matchup_type"]){
                    log = typelog.descriptionLog;
                    if (widget.game.logsEvent![index]["id_log_matchup_type"] != 1 && widget.game.logsEvent![index]["id_log_matchup_type"] != 2 &&
                    widget.game.logsEvent![index]["id_log_matchup_type"] != 8 && widget.game.logsEvent![index]["id_log_matchup_type"] != 9){
                      for (var player in players){
                        if(player.idPlayer == widget.game.logsEvent![index]["id_log_matchup_player"]){
                          logPlayer = '${player.numberPlayer} - ${player.namePlayer}';
                          if(widget.game.idHomeTeamEvent == player.idTeamPlayer){
                              alignment = TextAlign.left;
                          }else{
                              alignment = TextAlign.right;
                          }
                        }
                      }
                    }
                  }
                }
                return Padding(
                  padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
                  child: ListTile(
                    title: Text(
                      log,
                      textAlign: alignment,
                    ),
                    subtitle: Text(
                      logPlayer,
                      textAlign: alignment,
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
