import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/station.dart';
import '../../data/repositories/station_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final StationRepository repository;

  HomeViewModel(this.repository) {
    loadStations();
  }

  List<Station> _stations = [];
  bool _isLoading = true;
  String? _favoriteStationId;

  List<Station> get stations => _stations;
  bool get isLoading => _isLoading;
  String? get favoriteStationId => _favoriteStationId;

  Station? get favoriteStation {
    if (_favoriteStationId == null) return null;
    return _stations.firstWhere(
      (s) => s.info.stationId == _favoriteStationId,
      orElse: () => _stations.first,
    );
  }

  Future<void> loadStations() async {
    _isLoading = true;
    notifyListeners();

    _stations = await repository.getStations();
    await _loadFavoriteStation();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setFavoriteStation(String stationId) async {
    _favoriteStationId = stationId;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorite_station', stationId);
    notifyListeners();
  }

  Future<void> _loadFavoriteStation() async {
    final prefs = await SharedPreferences.getInstance();
    _favoriteStationId = prefs.getString('favorite_station');
  }
}
