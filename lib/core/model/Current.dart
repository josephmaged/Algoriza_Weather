import 'package:my_weather/core/model/AirQuality.dart';
import 'package:my_weather/core/model/Condition.dart';

class Current {
  Current(
      {required this.last_updated_epoch,
      required this.last_updated,
      required this.temp_c,
      required this.temp_f,
      required this.is_day,
      required this.condition,
      required this.wind_mph,
      required this.wind_kph,
      required this.wind_degree,
      required this.wind_dir,
      required this.pressure_mb,
      required this.pressure_in,
      required this.precip_mm,
      required this.precip_in,
      required this.humidity,
      required this.cloud,
      required this.feelslike_c,
      required this.feelslike_f,
      required this.vis_km,
      required this.vis_miles,
      required this.uv,
      required this.gust_mph,
      required this.gust_kph,
      required this.air_quality});

  Current.fromJson(dynamic json) {
    last_updated_epoch = json['last_updated_epoch'];
    last_updated = json['last_updated'];
    temp_c = json['temp_c'];
    temp_f = json['temp_f'];
    is_day = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    wind_mph = json['wind_mph'];
    wind_kph = json['wind_kph'];
    wind_degree = json['wind_degree'];
    wind_dir = json['wind_dir'];
    pressure_mb = json['pressure_mb'];
    pressure_in = json['pressure_in'];
    precip_mm = json['precip_mm'];
    precip_in = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslike_c = json['feelslike_c'];
    feelslike_f = json['feelslike_f'];
    vis_km = json['vis_km'];
    vis_miles = json['vis_miles'];
    uv = json['uv'];
    gust_mph = json['gust_mph'];
    air_quality = AirQuality.fromJson(json['air_quality']);
  }

  late int last_updated_epoch;
  late String last_updated;
  late double temp_c;
  late double temp_f;
  late int is_day;
  late Condition condition;
  late double wind_mph;
  late double wind_kph;
  late int wind_degree;
  late String wind_dir;
  late double pressure_mb;
  late double pressure_in;
  late double precip_mm;
  late double precip_in;
  late int humidity;
  late int cloud;
  late double feelslike_c;
  late double feelslike_f;
  late double vis_km;
  late double vis_miles;
  late double uv;
  late double gust_mph;
  late double gust_kph;
  late AirQuality air_quality;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_updated_epoch'] = last_updated_epoch;
    map['last_updated'] = last_updated;
    map['temp_c'] = temp_c;
    map['temp_f'] = temp_f;
    map['is_day'] = is_day;
    map['condition'] = condition;
    map['wind_mph'] = wind_mph;
    map['wind_kph'] = wind_kph;
    map['wind_degree'] = wind_degree;
    map['wind_dir'] = wind_dir;
    map['pressure_mb'] = pressure_mb;
    map['pressure_in'] = pressure_in;
    map['precip_mm'] = precip_mm;
    map['precip_in'] = precip_in;
    map['humidity'] = humidity;
    map['cloud'] = cloud;
    map['feelslike_c'] = feelslike_c;
    map['feelslike_f'] = feelslike_f;
    map['vis_km'] = vis_km;
    map['vis_miles'] = vis_miles;
    map['uv'] = uv;
    map['gust_mph'] = gust_mph;
    map['gust_kph'] = gust_kph;
    map['air_quality'] = air_quality;
    return map;
  }
}
