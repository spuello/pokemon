import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon/pokemon/presentation/screen/pokemon_detail_screen.dart';

class PokemonListScreen extends StatelessWidget {
  static const String routeName = 'pokemon_list_screen';

  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonSuccessListLoad) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final item = state.list[index];
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PokemonDetailScreen.routeName);
                  },
                  title: Text(
                    item,
                    style: const TextStyle(
                        color: Colors.amber, fontWeight: FontWeight.w700),
                  ),
                );
              },
            );
          }
          return Container(color: Colors.red);
        },
      ),
    );
  }
}
