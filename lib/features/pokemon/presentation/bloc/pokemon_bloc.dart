import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/core/constant/api_path.dart';

import '../../../../core/services/chopper_http_client_service.dart';
import '../../entities/pokemon.dart';
import '../../entities/pokemon_list.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState.initial()) {
    on<PokemonListLoaded>(_onPokemonListLoaded);
    on<PokemonSelected>(_onPokemonSelected);
  }

  FutureOr<void> _onPokemonListLoaded(
      PokemonListLoaded event, Emitter<PokemonState> emit) async {
    emit(PokemonState.loading());
    try {
      PokemonList pokemonList = await _loadPokemon();
      emit(PokemonState.success(pokemonList.items));
    } catch (_) {
      emit(PokemonState.failure());
    }
  }

  Future<PokemonList> _loadPokemon() async {
    final client = ChopperHttpClientService.create();
    final response = await client.get(endpoint: APIPath.pokemonList);

    final pokemonList = PokemonList.fromJson({"items": response.body})
      ..items.where((element) => element.name != null);
    return pokemonList;
  }

  FutureOr<void> _onPokemonSelected(
      PokemonSelected event, Emitter<PokemonState> emit) {
    emit(state.copyWith(selected: event.item));
  }
}
