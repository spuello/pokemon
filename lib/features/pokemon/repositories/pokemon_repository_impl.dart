import '../../../core/constant/api_path.dart';
import '../../../core/services/chopper_http_client_service.dart';
import '../entities/pokemon.dart';
import '../entities/pokemon_list.dart';
import 'pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final ChopperHttpClientService client;

  const PokemonRepositoryImpl({
    required this.client,
  });

  @override
  Future<List<Pokemon>> getAll() async {
    final response = await client.get(endpoint: APIPath.pokemonList);
    final result = PokemonList.fromJson(response.body);
    final items =
        result.results.where((element) => element.name != null).toList();
    return items;
  }
}
