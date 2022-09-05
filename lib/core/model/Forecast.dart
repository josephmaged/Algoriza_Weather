import 'Forecastday.dart';

class Forecast {
  Forecast({
      required this.forecastday,});

  Forecast.fromJson(dynamic json) {
    if (json['forecastday'] != null) {
      forecastday = [];
      json['forecastday'].forEach((v) {
        forecastday.add(Forecastday.fromJson(v));
      });
    }
  }
  late List<Forecastday> forecastday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (forecastday != null) {
      map['forecastday'] = forecastday.map((v) => v.toJson()).toList();
    }
    return map;
  }

}