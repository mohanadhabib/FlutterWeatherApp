class Location{
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzID;
  final num? localTimeEpoch;
  final String? localTime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzID,
    required this.localTimeEpoch,
    required this.localTime
  });

  factory Location.fromJson(Map<String,dynamic> json){
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      tzID: json['tz_id'],
      localTimeEpoch: json['localtime_epoch'],
      localTime: json['localtime']
    );
  }
}