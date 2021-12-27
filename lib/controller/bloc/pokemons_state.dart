part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsState {}

class PokemonsInitial extends PokemonsState {}

class PokemonsLoadInProgress extends PokemonsState {}

class PokemonsPageLoadSucces extends PokemonsState {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNetxPage;

  PokemonsPageLoadSucces(
      {required this.pokemonListings, required this.canLoadNetxPage});
}

class PokemonsPageLoadFailed extends PokemonsState {
  final Error error;

  PokemonsPageLoadFailed({required this.error});
}
