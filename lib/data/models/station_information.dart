class StationInformation {
  final String stationId;
  final String name;
  final String address;
  final double lat;
  final double lon;
  final int capacity;

  StationInformation({
    required this.stationId,
    required this.name,
    required this.address,
    required this.lat,
    required this.lon,
    required this.capacity,
  });

  factory StationInformation.fromJson(Map<String, dynamic> json) {
    return StationInformation(
      stationId: json['station_id'],
      name: json['name'],
      address: json['address'] ?? '',
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      capacity: json['capacity'] ?? 0,
    );
  }
}
