import 'package:pokemon/data/models/pokemon_model.dart';

// ignore: constant_identifier_names
const String API_URL = 'https://pokeapi.co';

abstract class ApiRepository {
  Future<PokemonModel> getPost(String pokenome);
}
