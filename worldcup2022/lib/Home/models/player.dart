class Player{
  late int idPlayer;
  late String namePlayer;
  late int numberPlayer;
  late int idTeamPlayer;

  Player.fromJson(Map<String, dynamic> json){
    idPlayer = json["id_player"];
    namePlayer = json["name_player"];
    numberPlayer = json["number_player"];
    idTeamPlayer = json["id_player_team"];
  }
}