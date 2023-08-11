import 'package:flutter/material.dart';

import '../widgets/pokemon_card.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const String routeName = 'pokemon_detail_screen';

  const PokemonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pokemon detail"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: PokemonCard(),
      ),
    );
  }
}
