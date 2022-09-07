
class Event{
  final String titleEvent;
  final String subtitleEventHours;
  final DateTime dateEvent;
  final List<dynamic>? logsEvent;

  Event({required this.titleEvent, required this.subtitleEventHours, required this.dateEvent, this.logsEvent});
}