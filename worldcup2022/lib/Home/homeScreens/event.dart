
class Event{
  final int idHomeTeamEvent;
  final int idVisitEvent;
  final String titleEvent;
  final String subtitleEventHours;
  final DateTime dateEvent;
  final List<dynamic>? logsEvent;

  Event({required this.idHomeTeamEvent, required this.idVisitEvent, 
  required this.titleEvent, required this.subtitleEventHours, 
  required this.dateEvent, this.logsEvent});
}