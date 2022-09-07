import 'package:flutter/material.dart';


class MatchupDate{
  late String homeTeam;
  late String visit;
  late int homeTeamGols;
  late int visiteGols;
  late String date;
  late List<dynamic> logs; 
  final List<String> teams = ["Alemanha", "Arábia Saudita", "Argentina", "Austrália", "Bélgica", "Brasil", "Camarões", "Canadá", "Catar", "Coreia do Sul", "Costa Rica", "Croácia", "Dinamarca", "Equador", "Espanha", "Estados Unidos", "França", "Gana", "Holanda", "Inglaterra", "Irã", "Japão", "Marrocos", "México", "País de Gales", "Polônia", "Portugal", "Senegal", "Sérvia", "Suíça", "Tunísia", "Uruguai"];

  // MatchupDate({required this.homeTeam, required this.visit,
  //              required this.homeTeamGols, required this.visiteGols,
  //              required this.date, required this.logs});
  
  MatchupDate.fromJson(Map<String, dynamic> json){
    homeTeam = teams[json["matchps_team"][0]["id_matchup_team2"]];
    visit = teams[json["matchps_team"][1]["id_matchup_team2"]];
    homeTeamGols = json["matchps_team"][0]["qtd_gols"];
    visiteGols = json["matchps_team"][1]["qtd_gols"];
    date = json["date_matchup"];
    logs = json["logs_matchup"];
  }
}