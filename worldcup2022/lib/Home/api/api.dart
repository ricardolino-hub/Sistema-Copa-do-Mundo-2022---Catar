import 'dart:convert';
import 'package:http/http.dart' as http;

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
}
