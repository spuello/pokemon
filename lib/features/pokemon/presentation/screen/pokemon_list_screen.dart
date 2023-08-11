import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_bloc.dart';
import '../widgets/error_feedback.dart';
import 'pokemon_detail_screen.dart';

class PokemonListScreen extends StatelessWidget {
  static const String routeName = 'pokemon_list_screen';

  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state.isSuccess) {
              return Text("${state.list!.length} Pokemons "
                  "found");
            }
            return const Text("Pokemon");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state.isSuccess) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.list!.length,
                itemBuilder: (context, index) {
                  final item = state.list![index];
                  return ListTile(
                    onTap: () {
                      context
                          .read<PokemonBloc>()
                          .add(PokemonSelected(item: item));
                      Navigator.pushNamed(
                        context,
                        PokemonDetailScreen.routeName,
                      );
                    },
                    title: Text(
                      item.name ?? '',
                      style: const TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                },
              );
            } else if (state.isLoading) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 75.0,
                      width: 75.0,
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Loading...",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
              );
            } else if (state.isFailure) {
              return const FeedbackError(
                content:
                    "Trouble loading the Pokémon names from our server right now.",
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
