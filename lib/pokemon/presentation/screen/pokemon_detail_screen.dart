import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  static const String routeName = 'pokemon_detail_screen';

  const PokemonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'PokemonDetailScreen',
          style: TextStyle(
              color: Colors.amber, fontSize: 24.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
