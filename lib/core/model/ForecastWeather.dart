import 'Location.dart';
import 'Current.dart';
import 'Forecast.dart';

class ForecastWeather {
  ForecastWeather({
      required this.location,
      required this.current,
      required this.forecast,});

  ForecastWeather.fromJson(dynamic json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
    forecast = Forecast.fromJson(json['forecast']);
  }
  late Location location;
  late Current current;
  late Forecast forecast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location.toJson();
    }
    if (current != null) {
      map['current'] = current.toJson();
    }
    if (forecast != null) {
      map['forecast'] = forecast.toJson();
    }
    return map;
  }

}