import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/data/repository/implementations/http_api_repository.dart';
import 'package:pokemon/presentation/controllers.dart';

const POST_ID_TO_LOAD = 'limber';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late PokemonController _pokeCtrl;

  @override
  void initState() {
    super.initState();
    _pokeCtrl = PokemonController(HttpApiRepository(client: Client()));

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _pokeCtrl.onLoadPost(POST_ID_TO_LOAD);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Pokemons"),
      ),
      body: _pokeCtrl.isLoading
          ? const Center(child: CircularProgressIndicator())
          : _pokeCtrl.getErrorLoadingPokemon == null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        _pokeCtrl.getLoadedPokemon?.nome ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _pokeCtrl.getLoadedPokemon?.body ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Text(
                      _pokeCtrl.getErrorLoadingPokemon!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
    );
  }
}
