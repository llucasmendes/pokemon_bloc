import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc/controller/cubit/pokemons_cubit.dart';

class PokedexViewCubit extends StatelessWidget {
  const PokedexViewCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PokemonsCubit>().catchThenAll();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diletta Pokedex'),
      ),
      body: BlocBuilder<PokemonsCubit, PokemonsState>(
        builder: (context, state) {
          if (state is PokemonsLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonsPageLoadSucces) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: state.pokemonListings.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokemonListings[index].imageURL),
                          Text(state.pokemonListings[index].name)
                        ],
                      ),
                    ),
                  );
                });
          } else if (state is PokemonsPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
