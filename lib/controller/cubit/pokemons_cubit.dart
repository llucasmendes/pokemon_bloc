import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_bloc/model/pokemon_listing.dart';
import 'package:pokemon_bloc/model/pokemon_repository.dart';

part 'pokemons_state.dart';

class PokemonsCubit extends Cubit<PokemonsState> {
  PokemonsCubit() : super(PokemonsInitial());
  final _pokemonRepository = PokemonRepository();
  Future<void> catchThenAll() async {
    emit(PokemonsLoadInProgress());
    try {
      final pokemonPageResponse = await _pokemonRepository.getPokemonPage(0);
      emit(PokemonsPageLoadSucces(
        pokemonListings: pokemonPageResponse.pokemonListings,
        canLoadNetxPage: pokemonPageResponse.canLoadNextPage,
      ));
    } catch (e) {
      emit(PokemonsPageLoadFailed(error: e as Error));
    }
  }
}
