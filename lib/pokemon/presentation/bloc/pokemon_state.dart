part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonSuccessListLoad extends PokemonState {
  final List<Pokemon> list;

  PokemonSuccessListLoad({required this.list});
}
