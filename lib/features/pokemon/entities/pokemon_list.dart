import 'package:json_annotation/json_annotation.dart';

import 'pokemon.dart';

part 'pokemon_list.g.dart';

@JsonSerializable()
class PokemonList {
  final List<Pokemon> items;

  const PokemonList({
    required this.items,
  });

  factory PokemonList.fromJson(dynamic items) =>
      _$PokemonListFromJson({"items": items});

  Map<String, dynamic> toJson() => _$PokemonListToJson(this);
}
