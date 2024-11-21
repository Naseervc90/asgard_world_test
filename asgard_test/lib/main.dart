import 'package:asgard_test/core/theme/app_theme.dart';
import 'package:asgard_test/features/map/blocs/bloc/map_bloc.dart';
import 'package:asgard_test/features/map/presentation/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Map',
      theme: AppTheme.lightTheme,
      home: BlocProvider(
        create: (context) => MapBloc(),
        child: const MapScreen(),
      ),
    );
  }
}
