import 'package:flutter/material.dart';
import '../../utils/pdf_generator.dart';

import '../../data/models/station.dart';
import '../../data/repositories/station_repository.dart';

class StationDetailViewModel extends ChangeNotifier {
  final StationRepository repository;

  StationDetailViewModel(this.repository);

  Station? _station;
  bool _isLoading = false;

  Station? get station => _station;
  bool get isLoading => _isLoading;

  Future<void> loadStationById(String stationId) async {
    _isLoading = true;
    notifyListeners();

    final stations = await repository.getStations();
    _station = stations.firstWhere((s) => s.info.stationId == stationId);

    _isLoading = false;
    notifyListeners();
  }

  String get decision {
    if (_station == null) return '';

    if (_station!.status.numEbikesAvailable > 0) {
      return 'Sí';
    }
    if (_station!.totalBikes > 0) {
      return 'Quizá';
    }
    return 'No';
  }

  String get decisionExplanation {
    if (_station == null) return '';

    if (_station!.status.numEbikesAvailable > 0) {
      return 'Hay al menos una bicicleta eléctrica disponible.';
    }
    if (_station!.totalBikes > 0) {
      return 'Solo hay bicicletas mecánicas disponibles.';
    }
    return 'No hay bicicletas disponibles en este momento.';
  }

  Future<void> exportPdf() async {
    if (_station == null) return;
    await PdfGenerator.generateStationReport(_station!);
  }
}
