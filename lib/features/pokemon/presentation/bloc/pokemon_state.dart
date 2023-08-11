part of 'pokemon_bloc.dart';

enum Status { initial, loading, success, failure }

class PokemonState {
  final Status status;
  final List<Pokemon>? list;
  final Pokemon? selected;

  PokemonState({this.list, this.selected, required this.status});

  bool get isInitial => status == Status.initial;

  bool get isSuccess => status == Status.success;

  bool get isLoading => status == Status.loading;

  bool get isFailure => status == Status.failure;

  factory PokemonState.initial() => PokemonState(status: Status.initial);

  factory PokemonState.loading() => PokemonState(status: Status.loading);

  factory PokemonState.failure() => PokemonState(status: Status.failure);

  factory PokemonState.success(List<Pokemon>? list) =>
      PokemonState(status: Status.success, list: list);

  PokemonState copyWith(
      {Status? status, List<Pokemon>? list, Pokemon? selected}) {
    return PokemonState(
      status: status ?? this.status,
      list: list ?? this.list,
      selected: selected ?? this.selected,
    );
  }

  @override
  String toString() {
    return 'PokemonState{status: $status selected: $selected}';
  }
}
