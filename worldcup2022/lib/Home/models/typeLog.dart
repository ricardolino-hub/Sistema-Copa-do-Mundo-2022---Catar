class TypeLog{
  late int idTypeLog;
  late String descriptionLog;

  TypeLog.fromJson(Map<String, dynamic> json){
    idTypeLog = json["id_type_log"];
    descriptionLog = json["description"];
  }
}