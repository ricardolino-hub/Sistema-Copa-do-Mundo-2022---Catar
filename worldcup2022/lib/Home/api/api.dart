import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:worldcup2022/Home/models/matchups.dart';
import 'package:worldcup2022/Home/models/player.dart';
import 'package:worldcup2022/Home/models/typeLog.dart';

class Api {
  static String urlBase = 'http://localhost:3000';
  // static String urlBase = 'http://ipMaquina:3000';
  /**
   * Para funcionar em outros dispositivos é necessário informar o ip da máquina e que os outros dispositivos estejam na mesma rede
   */

  static Future<List> getTeamsAndPlayers() async {
    Uri url = Uri.parse(urlBase + '/teams/players');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return ['Erro'];
    }
  }

  static Future<List<Matchup>> getMatchups() async{
    Uri url = Uri.parse(urlBase + '/matchups');
    try{
      http.Response response = await http.get(url);
      List<Matchup> matchups = json.decode(response.body).map<Matchup>((item) => Matchup.fromJson(item)).toList();
      return matchups;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<List<Player>> getPlayers() async{
    Uri url = Uri.parse(urlBase + '/players');
    try{
      http.Response response = await http.get(url);
      List<Player> players = json.decode(response.body).map<Player>((item) => Player.fromJson(item)).toList();
      return players;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<List<TypeLog>> getTypeLog() async{
    Uri url = Uri.parse(urlBase + '/type-logs');
    try{
      http.Response response = await http.get(url);
      List<TypeLog> typeLogs = json.decode(response.body).map<TypeLog>((item) => TypeLog.fromJson(item)).toList();
      return typeLogs;
    }catch(e){
      throw Exception(e.toString());
    }
  }
}
