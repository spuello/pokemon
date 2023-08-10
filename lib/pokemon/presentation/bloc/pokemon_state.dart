part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonSuccessListLoad extends PokemonState {
  // final List<Pokemon> list;
  final List<String> list;

  PokemonSuccessListLoad({required this.list});
}
