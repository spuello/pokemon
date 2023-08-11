import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_bloc.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const String routeName = 'pokemon_detail_screen';

  const PokemonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            return Text(
              "${state.selected!.name} details",
            );
          },
        )),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
        ));
  }
}
