import 'package:get_it/get_it.dart';

import 'pokemon/presentation/bloc/pokemon_bloc.dart';

final sl = GetIt.instance;

//Juda.Vallejo@theksquaregroup.com

void init() {
  // BLOC
  sl.registerLazySingleton(
    () => PokemonBloc(),
  );
}
