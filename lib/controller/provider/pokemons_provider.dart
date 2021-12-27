import 'package:flutter/foundation.dart';
import 'package:pokemon_bloc/model/pokemon_page_response.dart';
import 'package:pokemon_bloc/model/pokemon_repository.dart';

class PokemonsProvider extends ChangeNotifier {
  final _pokemonRepository = PokemonRepository();
  PokemonPageResponse _response =
      PokemonPageResponse(canLoadNextPage: false, pokemonListings: []);

  get response => _response;

  Future<void> catchThenAll() async {
    try {
      _response = await _pokemonRepository.getPokemonPage(0);
    } catch (e) {
      throw Exception(e);
    }
    notifyListeners();
  }
}
