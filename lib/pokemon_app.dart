import 'package:flutter/material.dart';

import 'app_router.dart';

class PokemonApp extends StatelessWidget {
  PokemonApp({super.key});

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}
