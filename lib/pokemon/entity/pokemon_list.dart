import 'package:json_annotation/json_annotation.dart';

import 'pokemon.dart';

part 'pokemon_list.g.dart';

@JsonSerializable()
class PokemonList {
  final List<Pokemon> items;

  const PokemonList({
    required this.items,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) =>
      _$PokemonListFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListToJson(this);
}
