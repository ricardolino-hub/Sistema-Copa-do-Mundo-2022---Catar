import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:worldcup2022/Home/models/matchups.dart';
import 'package:worldcup2022/Home/models/player.dart';
import 'package:worldcup2022/Home/models/typeLog.dart';

class Api {
  static Future<List> getTeamsAndPlayers() async {
    Uri url = Uri.parse('http://localhost:3000/teams/players');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return ['Erro'];
    }
  }

  static Future<List<Matchup>> getMatchups() async{
    Uri url = Uri.parse('http://localhost:3000/matchup');
    try{
      http.Response response = await http.get(url);
      List<Matchup> matchups = json.decode(response.body).map<Matchup>((item) => Matchup.fromJson(item)).toList();
      return matchups;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<List<Player>> getPlayers() async{
    Uri url = Uri.parse('http://localhost:3000/player');
    try{
      http.Response response = await http.get(url);
      List<Player> players = json.decode(response.body).map<Player>((item) => Player.fromJson(item)).toList();
      return players;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<List<TypeLog>> getTypeLog() async{
    Uri url = Uri.parse('http://localhost:3000/type-log');
    try{
      http.Response response = await http.get(url);
      List<TypeLog> typeLogs = json.decode(response.body).map<TypeLog>((item) => TypeLog.fromJson(item)).toList();
      return typeLogs;
    }catch(e){
      throw Exception(e.toString());
    }
  }
}
