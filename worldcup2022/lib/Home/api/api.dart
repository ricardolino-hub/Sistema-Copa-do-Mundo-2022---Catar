import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/matchups.dart';

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
}
