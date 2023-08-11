import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon/features/pokemon/repositories/pokemon_repository.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

class MockPokemonBloc extends MockBloc<PokemonEvent, PokemonState>
    implements PokemonBloc {}
