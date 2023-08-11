import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/pokemon_bloc.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../mocks..dart';

void main() {
  late MockPokemonRepository mockPokemonRepository;

  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
  });

  PokemonBloc buildBloc() => PokemonBloc(repository: mockPokemonRepository);

  group('PokemonListLoaded', () {
    final jsonString = fixtureFromJson('pokemon.json');
    final list = PokemonList.fromJson(jsonString);

    blocTest<PokemonBloc, PokemonState>(
      'Emits a list of Pokemon upon successful retrieval from the backend',
      build: buildBloc,
      setUp: () {
        when(() => mockPokemonRepository.getAll())
            .thenAnswer((_) async => list.items);
      },
      act: (bloc) => bloc.add(PokemonListLoaded()),
      expect: () => [
        isA<PokemonState>()
            .having((p0) => p0.status, 'status', equals(Status.loading)),
        isA<PokemonState>()
            .having((p0) => p0.status, 'status', equals(Status.success))
            .having((p0) => p0.list, 'list', isNotEmpty)
      ],
    );

    blocTest<PokemonBloc, PokemonState>(
      'Emits an error on backend Pokemon list retrieval failure.',
      build: buildBloc,
      setUp: () {
        when(() => mockPokemonRepository.getAll()).thenThrow(Exception());
      },
      act: (bloc) => bloc.add(PokemonListLoaded()),
      expect: () => [
        isA<PokemonState>()
            .having((p0) => p0.status, 'status', equals(Status.loading)),
        isA<PokemonState>()
            .having((p0) => p0.status, 'status', equals(Status.failure))
      ],
    );
  });
}
