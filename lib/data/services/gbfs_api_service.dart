import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/station_information.dart';
import '../models/station_status.dart';

class GbfsApiService {
  static const _infoUrl =
      'https://acoruna.publicbikesystem.net/customer/gbfs/v2/gl/station_information';
  static const _statusUrl =
      'https://acoruna.publicbikesystem.net/customer/gbfs/v2/gl/station_status';

  final http.Client _client = http.Client();

  Future<List<StationInformation>> fetchStationInformation() async {
    final response = await _client.get(Uri.parse(_infoUrl));

    if (response.statusCode != 200) {
      throw Exception('Error fetching station information');
    }

    final data = json.decode(response.body);
    final List stations = data['data']['stations'];

    return stations.map((e) => StationInformation.fromJson(e)).toList();
  }

  Future<List<StationStatus>> fetchStationStatus() async {
    final response = await _client.get(Uri.parse(_statusUrl));

    if (response.statusCode != 200) {
      throw Exception('Error fetching station status');
    }

    final data = json.decode(response.body);
    final List stations = data['data']['stations'];

    return stations.map((e) => StationStatus.fromJson(e)).toList();
  }
}
