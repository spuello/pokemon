part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonListLoaded extends PokemonEvent {}

class PokemonSelected extends PokemonEvent {
  final Pokemon item;

  const PokemonSelected({
    required this.item,
  });
}
