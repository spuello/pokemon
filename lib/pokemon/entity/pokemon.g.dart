// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'] as int,
      pokemonId: json['pokemonId'] as String,
      name: json['name'] as String,
      form: json['form'],
      type1: json['type1'] as String,
      type2: json['type2'] as String,
      generation: json['generation'] as int,
      atk: json['atk'] as int,
      sta: json['sta'] as int,
      def: json['def'] as int,
      maxcp: json['maxcp'] as int,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'pokemonId': instance.pokemonId,
      'name': instance.name,
      'form': instance.form,
      'type1': instance.type1,
      'type2': instance.type2,
      'generation': instance.generation,
      'atk': instance.atk,
      'sta': instance.sta,
      'def': instance.def,
      'maxcp': instance.maxcp,
    };
