class StationStatus {
  final String stationId;
  final int numBikesAvailable;
  final int numEbikesAvailable;
  final int numDocksAvailable;
  final int lastReported;

  StationStatus({
    required this.stationId,
    required this.numBikesAvailable,
    required this.numEbikesAvailable,
    required this.numDocksAvailable,
    required this.lastReported,
  });

  factory StationStatus.fromJson(Map<String, dynamic> json) {
    return StationStatus(
      stationId: json['station_id'],
      numBikesAvailable: json['num_bikes_available'] ?? 0,
      numEbikesAvailable: json['num_ebikes_available'] ?? 0,
      numDocksAvailable: json['num_docks_available'] ?? 0,
      lastReported: json['last_reported'] ?? 0,
    );
  }
}
