import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:worldcup2022/Home/api/api.dart';
import 'event.dart';
import 'logsMatchup.dart';


class MatchupCalender extends StatefulWidget {
  const MatchupCalender({Key? key}) : super(key: key);

  @override
  State<MatchupCalender> createState() => _MatchupCalenderState();
}

class _MatchupCalenderState extends State<MatchupCalender> {
  var firstDay = DateTime(2022, 8, 1);
  var lastDay = DateTime(2023, 1, 31);
  var focusedDay = DateTime.now();
  var selectedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.week;
  List<Event> listEvents = [];
  LinkedHashMap<DateTime, List<Event>>? _groupedEvents;

  @override
  void initState(){
    super.initState();
    addSchedules();
  }

  Future addSchedules() async{
    await Api.getMatchups().then((schedules){
      for (var event in schedules){
        listEvents.add(Event(
          titleEvent: '${event.homeTeam} ${event.homeTeamGols} x ${event.visiteGols} ${event.visit}',
          subtitleEventHours: '${DateTime.parse(event.date).hour - 3}:${DateTime.parse(event.date).minute}0',
          dateEvent: DateTime.parse(event.date),
          logsEvent: event.logs
        ));
      }
      // for (var event in listEvents){
      //   print(
      //     '${event.titleEvent} ${event.dateEvent.toString()}',
      //   );
      // }
    });
    _groupEvents(listEvents);
  }

  int getHashCode(DateTime key){
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  _groupEvents(List<Event> events){
    _groupedEvents = LinkedHashMap(equals: isSameDay, hashCode: getHashCode);
    for (var event in events){
      DateTime date = DateTime.utc(event.dateEvent.year, event.dateEvent.month, event.dateEvent.day, 12);
      if(_groupedEvents![date]==null) _groupedEvents![date] = [];
      _groupedEvents![date]!.add(event);
    }
  }

  List<dynamic> _getEventsForDay(DateTime date){
    return _groupedEvents?[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          eventLoader: _getEventsForDay,
          onDaySelected: (newselectedDay, newfocusedDay){
            setState(() {
              selectedDay = newselectedDay;
              focusedDay = newselectedDay;
            });
          },
          selectedDayPredicate: (day) => isSameDay(day, selectedDay),
          focusedDay: focusedDay, 
          firstDay: firstDay, 
          lastDay: lastDay,
          calendarFormat: format,
          onFormatChanged: (CalendarFormat _format){
            setState(() {
              format = _format;
            });
          },
          headerStyle: const HeaderStyle(
            headerPadding: EdgeInsets.zero
          ),
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(255, 170, 3, 47),
              shape: BoxShape.circle
            ),
            todayDecoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle
            )
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder:(context, day, events){
              if(events.isNotEmpty){
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 2.0,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 170, 3, 47),
                          shape: BoxShape.circle,
                        ),
                      )
                    )
                  ],
                );
              }
            }
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 30/5.5,
            children: [
              ..._getEventsForDay(selectedDay).map((event) => Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: ListTile(
                  title: Text(
                    event.titleEvent,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    event.subtitleEventHours,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => LogMatchups(logs: event.logsEvent,)
                        )
                    );
                  },
                ),
              ))
            ],
          )
        )
      ],
    );
  }
}