import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'features/pokemon/presentation/screen/pokemon_detail_screen.dart';
import 'features/pokemon/presentation/screen/pokemon_list_screen.dart';
import 'injection_container.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case PokemonListScreen.routeName:
        return _buildPage(
          BlocProvider.value(
            value: sl<PokemonBloc>()..add(PokemonListLoaded()),
            child: const PokemonListScreen(),
          ),
          settings: settings,
        );
      case PokemonDetailScreen.routeName:
        return _buildPage(
          BlocProvider.value(
            value: sl<PokemonBloc>(),
            child: const PokemonDetailScreen(),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static PageRouteBuilder _buildPage(Widget page, {RouteSettings? settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      reverseTransitionDuration: const Duration(),
      transitionDuration: const Duration(),
    );
  }
}
