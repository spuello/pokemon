
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_bloc.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return Row(children: [
          const Text("Name:"),
          Text(
            state.selected!.name ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.teal),
          )
        ]);
      },
    );
  }
}
