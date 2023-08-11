import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/core/constant/api_path.dart';
import 'package:pokemon/pokemon/entity/pokemon.dart';
import 'package:pokemon/pokemon/entity/pokemon_list.dart';

import '../../../core/services/chopper_http_client_service.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonListLoaded>(_onPokemonListLoaded);
  }

  FutureOr<void> _onPokemonListLoaded(
      PokemonListLoaded event, Emitter<PokemonState> emit) async {
    final client = ChopperHttpClientService.create();
    final response = await client.get(endpoint: APIPath.pokemonList);

    final pokemonList = PokemonList.fromJson({"items": response.body})
      ..items.where((element) => element.name != null);

    emit(PokemonSuccessListLoad(list: pokemonList.items));
  }
}
