import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  //Wir können hier auch terminslotId-s speichern?
  final String title;
  final DateTime time;

  const Event(this.title, this.time);

  @override
  String toString() => title;
}

//Events in Map: key: datum, value: List von Events

Map<DateTime, List<Event>> kEventSource = {DateTime (2022, 5, 16): [Event('Termin 2', DateTime(2022, 5, 16, 9, 20))],
                                            DateTime (2022, 5, 17): [Event('Termin 3', DateTime(2022, 5, 17, 11, 20)), Event('Termin 4', DateTime(2022, 5, 17, 12, 20))]
};


final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(kEventSource);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 2, kToday.day);