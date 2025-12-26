import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t51/ui/viewmodel/home_viewmodel.dart';
import 'station_detail_view.dart';
import '../widgets/top_stations_bar_chart.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('BiciCoruña')),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (vm.favoriteStation != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estación favorita',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(vm.favoriteStation!.info.name),
                          Text(
                            'Bicis disponibles: ${vm.favoriteStation!.totalBikes}',
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                Text(
                  'Top estaciones con más bicis',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                TopStationsBarChart(stations: vm.stations),
                const SizedBox(height: 24),
                const Divider(),
                ...vm.stations.map(
                  (station) => ListTile(
                    title: Text(station.info.name),
                    subtitle: Text(
                      'Bicis: ${station.totalBikes} | E-bikes: ${station.status.numEbikesAvailable}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.star_border),
                      onPressed: () =>
                          vm.setFavoriteStation(station.info.stationId),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StationDetailView(
                            stationId: station.info.stationId,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
