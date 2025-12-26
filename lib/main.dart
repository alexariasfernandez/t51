import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t51/app_theme.dart';
import 'package:t51/ui/viewmodel/home_viewmodel.dart';
import 'package:t51/ui/viewmodel/station_detail_viewmodel.dart';

import 'data/repositories/station_repository.dart';
import 'data/services/gbfs_api_service.dart';

import 'ui/views/home_view.dart';

void main() {
  runApp(const BiciCorunaApp());
}

class BiciCorunaApp extends StatelessWidget {
  const BiciCorunaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => StationRepository(GbfsApiService()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              HomeViewModel(context.read<StationRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              StationDetailViewModel(context.read<StationRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'BiciCoruña',
        theme: AppTheme.lightTheme,
        home: const HomeView(),
      ),
    );
  }
}