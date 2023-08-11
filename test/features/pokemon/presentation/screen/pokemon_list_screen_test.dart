import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/entities/pokemon_list.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/screen/pokemon_list_screen.dart';
import 'package:pokemon/features/pokemon/presentation/widgets/error_feedback.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../mocks..dart';
import '../../../../robot_tester.dart';

final jsonString = fixtureFromJson('pokemon.json');
final tPokemonList = PokemonList.fromJson(jsonString);

void main() {
  late PokemonBloc pokemonBloc;
  setUp(() {
    pokemonBloc = MockPokemonBloc();
  });

  Future<void> makePokemonListScreen(WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    final robot = RobotTester(tester);
    await robot.makeTestableWidget(
      child: BlocProvider(
        create: (context) => pokemonBloc,
        child: const PokemonListScreen(),
      ),
    );
  }

  group(
    'PokemonListScreen',
    () {
      testWidgets(
        'Displays loading indicator during Pokemon list retrieval',
        (tester) async {
          when(() => pokemonBloc.state).thenReturn(PokemonState.loading());
          await makePokemonListScreen(tester);
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          expect(find.byType(ListView), findsNothing);
          expect(find.byType(FeedbackError), findsNothing);
        },
      );

      testWidgets(
        'Shows a list of Pokemon cards upon successful retrieval.',
        (tester) async {
          when(() => pokemonBloc.state)
              .thenReturn(PokemonState.success(tPokemonList.items));
          await makePokemonListScreen(tester);
          expect(find.byType(ListView), findsOneWidget);
          expect(find.byType(FeedbackError), findsNothing);
          expect(find.byType(CircularProgressIndicator), findsNothing);
        },
      );

      testWidgets(
        'Displays an error message when Pokémon retrieval fails.',
        (tester) async {
          when(() => pokemonBloc.state).thenReturn(PokemonState.failure());
          await makePokemonListScreen(tester);
          expect(find.byType(FeedbackError), findsOneWidget);
          expect(find.byType(CircularProgressIndicator), findsNothing);
          expect(find.byType(ListView), findsNothing);
        },
      );
    },
  );
}
