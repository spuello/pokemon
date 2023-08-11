// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_http_client_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
final class _$ChopperHttpClientService extends ChopperHttpClientService {
  _$ChopperHttpClientService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChopperHttpClientService;

  @override
  Future<Response<dynamic>> get({required String endpoint}) {
    final Uri $url = Uri.parse('https://db.pokemongohub.net/api/${endpoint}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
