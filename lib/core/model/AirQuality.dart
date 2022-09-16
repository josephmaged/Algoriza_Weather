class AirQuality {
  AirQuality({
      required this.no2,
      required this.o3,
      required this.so2,
      required this.pm25,
      required this.pm10,
      required this.usepaindex,
      required this.gbdefraindex,});

  AirQuality.fromJson(dynamic json) {
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    usepaindex = json['us-epa-index'];
    gbdefraindex = json['gb-defra-index'];
  }
  late double no2;
  late double o3;
  late double so2;
  late double pm25;
  late double pm10;
  late int usepaindex;
  late int gbdefraindex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['no2'] = no2;
    map['o3'] = o3;
    map['so2'] = so2;
    map['pm2_5'] = pm25;
    map['pm10'] = pm10;
    map['us-epa-index'] = usepaindex;
    map['gb-defra-index'] = gbdefraindex;
    return map;
  }

}