import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final int? id;
  final String? pokemonId;
  final String? name;

  const Pokemon({
    this.id,
    this.pokemonId,
    this.name,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  @override
  String toString() {
    return 'Pokemon{id: $id, pokemonId: $pokemonId, name: $name}';
  }
}
