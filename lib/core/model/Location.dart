class Location {
  Location(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon,
      required this.tz_id,
      required this.localtime_epoch,
      required this.localtime});

  Location.fromJson(dynamic json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tz_id = json['tz_id'];
    localtime_epoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  late String name;
  late String region;
  late String country;
  late double lat;
  late double lon;
  late String tz_id;
  late int localtime_epoch;
  late String localtime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['region'] = region;
    map['country'] = country;
    map['lat'] = lat;
    map['lon'] = lon;
    map['tz_id'] = tz_id;
    map['localtime_epoch'] = localtime_epoch;
    map['localtime'] = localtime;
    return map;
  }
}
