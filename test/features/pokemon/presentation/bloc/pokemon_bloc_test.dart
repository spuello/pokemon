import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/pokemon_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../mocks..dart';

final jsonString = fixtureFromJson('pokemon.json');
final tPokemonList = PokemonList.fromJson(jsonString);

void main() {
  late MockPokemonRepository mockPokemonRepository;

  setUpAll(() {
    mockPokemonRepository = MockPokemonRepository();
  });

  PokemonBloc buildBloc() => PokemonBloc(repository: mockPokemonRepository);

  group('PokemonListLoaded', () {
    blocTest<PokemonBloc, PokemonState>(
      'Emits a list of Pokemon upon successful retrieval from the backend',
      build: buildBloc,
      setUp: () {
        when(() => mockPokemonRepository.getAll())
            .thenAnswer((_) async => tPokemonList.results);
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

  group('PokemonSelected', () {
    blocTest<PokemonBloc, PokemonState>(
      'Emits PokemonState containing the selected Pokemon',
      build: buildBloc,
      setUp: () {
        when(() => mockPokemonRepository.getAll()).thenThrow(Exception());
      },
      act: (bloc) => bloc.add(PokemonSelected(item: tPokemonList.results.first)),
      expect: () => [
        isA<PokemonState>().having(
          (p0) => p0.selected,
          'selected',
          equals(tPokemonList.results.first),
        ),
      ],
    );
  });
}
