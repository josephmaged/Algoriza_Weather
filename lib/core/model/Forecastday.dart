import 'Day.dart';
import 'Astro.dart';
import 'Hour.dart';

class Forecastday {
  Forecastday({
      required this.date,
      required this.dateEpoch,
      required this.day,
      required this.astro,
      required this.hour,});

  Forecastday.fromJson(dynamic json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = Day.fromJson(json['day']);
    astro = Astro.fromJson(json['astro']);
    if (json['hour'] != null) {
      hour = [];
      json['hour'].forEach((v) {
        hour.add(Hour.fromJson(v));
      });
    }
  }
  late String date;
  late int dateEpoch;
  late Day day;
  late Astro astro;
  late List<Hour> hour;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['date_epoch'] = dateEpoch;
    if (day != null) {
      map['day'] = day.toJson();
    }
    if (astro != null) {
      map['astro'] = astro.toJson();
    }
    if (hour != null) {
      map['hour'] = hour.map((v) => v.toJson()).toList();
    }
    return map;
  }

}