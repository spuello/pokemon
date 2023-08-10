import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonListLoaded>(_onPokemonListLoaded);
  }

  FutureOr<void> _onPokemonListLoaded(
      PokemonListLoaded event, Emitter<PokemonState> emit) {
    final list = ['pokomen1', 'pokomen1', 'pokomen3'];
    emit(PokemonSuccessListLoad(list: list));
  }
}
