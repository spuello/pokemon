import 'package:chopper/chopper.dart';

import '../constant/api_path.dart';

part 'chopper_http_client_service.chopper.dart';

@ChopperApi(baseUrl: APIPath.productionUrl)
abstract class ChopperHttpClientService extends ChopperService {
  @Get(path: '{endpoint}')
  Future<Response> get({@Path() required String endpoint});

  static ChopperHttpClientService create() {
    final client = ChopperClient(
        converter: const JsonConverter(),
        services: [_$ChopperHttpClientService()],
        interceptors: [HttpLoggingInterceptor()]);

    return _$ChopperHttpClientService(client);
  }
}

//https://db.pokemongohub.net//api/pokemon/with-generation/1
//https://db.pokemongohub.net/api/pokemon/with-generation/1