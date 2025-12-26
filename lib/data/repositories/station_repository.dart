import '../models/station.dart';
import '../services/gbfs_api_service.dart';

class StationRepository {
  final GbfsApiService api;

  StationRepository(this.api);

  Future<List<Station>> getStations() async {
    final infoList = await api.fetchStationInformation();
    final statusList = await api.fetchStationStatus();

    final statusMap = {for (var s in statusList) s.stationId: s};

    return infoList
        .where((info) => statusMap.containsKey(info.stationId))
        .map((info) => Station(info: info, status: statusMap[info.stationId]!))
        .toList();
  }
}
