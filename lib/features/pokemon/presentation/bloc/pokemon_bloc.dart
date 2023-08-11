import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../entities/pokemon.dart';
import '../../repositories/pokemon_repository.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository repository;

  PokemonBloc({required this.repository}) : super(PokemonState.initial()) {
    on<PokemonListLoaded>(_onPokemonListLoaded);
    on<PokemonSelected>(_onPokemonSelected);
  }

  FutureOr<void> _onPokemonListLoaded(
    PokemonListLoaded event,
    Emitter<PokemonState> emit,
  ) async {
    emit(PokemonState.loading());
    try {
      final items = await repository.getAll();
      emit(PokemonState.success(items));
    } catch (_) {
      emit(PokemonState.failure());
    }
  }

  FutureOr<void> _onPokemonSelected(
      PokemonSelected event, Emitter<PokemonState> emit) {
    emit(state.copyWith(selected: event.item));
  }
}
