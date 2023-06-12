import 'dart:developer';

import 'package:pokemon/data/models/pokemon_model.dart';

import '../api_repository.dart';
import 'package:http/http.dart';

import '../errors/api_exception.dart';

class HttpApiRepository implements ApiRepository {
  final Client _client;

  HttpApiRepository({required Client client}) : _client = client;

  @override
  Future<PokemonModel> getPost(String pokenome) async {
    try {
      final url = '$API_URL/pokemon/$pokenome';

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return PokemonModel.fromJson(response.body);
      } else {
        throw ApiException(message: "Erro ao carregar pokemon!");
      }
    } catch (error, stacktrace) {
      log("Erro ao fazer get do pokemon", error: error, stackTrace: stacktrace);

      throw ApiException(message: "Erro ao carregar Pokemon");
    }
  }
}
