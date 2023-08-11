import 'package:get_it/get_it.dart';

import 'core/services/chopper_http_client_service.dart';
import 'features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'features/pokemon/repositories/pokemon_repository.dart';
import 'features/pokemon/repositories/pokemon_repository_impl.dart';

final sl = GetIt.instance;

//Juda.Vallejo@theksquaregroup.com

void init() {
  // BLOC
  sl.registerLazySingleton(
    () => PokemonBloc(repository: sl()),
  );

  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(client: sl()),
  );

  sl.registerLazySingleton<ChopperHttpClientService>(
      () => ChopperHttpClientService.create(),);
}
