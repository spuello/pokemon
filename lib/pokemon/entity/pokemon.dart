import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  final int id;
  final String pokemonId;
  final String name;
  final dynamic form;
  final String type1;
  final String type2;
  final int generation;
  final int atk;
  final int sta;
  final int def;
  final int maxcp;

  Pokemon({
    required this.id,
    required this.pokemonId,
    required this.name,
    this.form,
    required this.type1,
    required this.type2,
    required this.generation,
    required this.atk,
    required this.sta,
    required this.def,
    required this.maxcp,
  });
}
