import 'station_information.dart';
import 'station_status.dart';

class Station {
  final StationInformation info;
  final StationStatus status;

  Station({required this.info, required this.status});

  int get totalBikes => status.numBikesAvailable + status.numEbikesAvailable;
}
