import 'package:pokemon/data/models/pokemon_model.dart';
import 'package:pokemon/data/repository/api_repository.dart';
import 'package:pokemon/data/repository/errors/api_exception.dart';

class PokemonController {
  final ApiRepository apiRepository;

  PokemonController(this.apiRepository);

  String? _errorLoadingPokemon;

  String? get getErrorLoadingPokemon => _errorLoadingPokemon;

  bool isLoading = true;

  PokemonModel? _loadedPokemon;

  PokemonModel? get getLoadedPokemon => _loadedPokemon;

  Future<void> onLoadPost(String pokenome) async {
    isLoading = true;
    _errorLoadingPokemon = null;

    try {
      final pokemonpost = await apiRepository.getPost(pokenome);

      _loadedPokemon = pokemonpost;
    } on ApiException catch (ApiException) {
      _errorLoadingPokemon = ApiException.message;
    } catch (error) {
      _errorLoadingPokemon = "Erro ao carregar Pokemon";
    }
    isLoading = false;
  }
}
