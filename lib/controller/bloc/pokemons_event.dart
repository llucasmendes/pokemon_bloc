part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsEvent {}

class PokemonsPageRequest extends PokemonsEvent {
  final int page;

  PokemonsPageRequest({required this.page});
}
