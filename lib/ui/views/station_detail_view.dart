import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t51/ui/viewmodel/station_detail_viewmodel.dart';
import '../widgets/station_pie_chart.dart';

class StationDetailView extends StatefulWidget {
  final String stationId;

  const StationDetailView({super.key, required this.stationId});

  @override
  State<StationDetailView> createState() => _StationDetailViewState();
}

class _StationDetailViewState extends State<StationDetailView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StationDetailViewModel>().loadStationById(widget.stationId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<StationDetailViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle estación'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              context.read<StationDetailViewModel>().exportPdf();
            },
          ),
        ],
      ),
      body: vm.isLoading || vm.station == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  vm.station!.info.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(vm.station!.info.address),
                const SizedBox(height: 24),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: StationPieChart(station: vm.station!),
                  ),
                ),

                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¿Me compensa bajar ahora?',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        vm.decision,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(vm.decisionExplanation),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
