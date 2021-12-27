import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_bloc/model/pokemon_listing.dart';
import 'package:pokemon_bloc/model/pokemon_repository.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final _pokemonRepository = PokemonRepository();
  PokemonsBloc() : super(PokemonsInitial()) {
    on<PokemonsEvent>((event, emit) async {
      if (event is PokemonsPageRequest) {
        emit.call(PokemonsLoadInProgress());
        try {
          final pokemonPageResponse =
              await _pokemonRepository.getPokemonPage(event.page);
          emit.call(PokemonsPageLoadSucces(
            pokemonListings: pokemonPageResponse.pokemonListings,
            canLoadNetxPage: pokemonPageResponse.canLoadNextPage,
          ));
        } catch (e) {
          emit.call(PokemonsPageLoadFailed(error: e as Error));
        }
      }
    });
  }
}
