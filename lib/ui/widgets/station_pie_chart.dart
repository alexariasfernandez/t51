import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../data/models/station.dart';
class StationPieChart extends StatelessWidget {
  final Station station;

  const StationPieChart({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    final ebikes = station.status.numEbikesAvailable;
    final bikes = station.status.numBikesAvailable;
    final docks = station.status.numDocksAvailable;

    return SizedBox(
      height: 240,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 40,
          sectionsSpace: 2,
          sections: [
            PieChartSectionData(
              value: ebikes.toDouble(),
              title: 'E-bikes',
              color: Theme.of(context).colorScheme.primary,
              radius: 60,
            ),
            PieChartSectionData(
              value: bikes.toDouble(),
              title: 'Mecánicas',
              color: Theme.of(context).colorScheme.secondary,
              radius: 60,
            ),
            PieChartSectionData(
              value: docks.toDouble(),
              title: 'Anclajes',
              color: Colors.black54,
              radius: 60,
            ),
          ],
        ),
      ),
    );
  }
}