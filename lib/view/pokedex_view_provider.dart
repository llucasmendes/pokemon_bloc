import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_bloc/controller/provider/pokemons_provider.dart';

class PokedexViewProvider extends StatelessWidget {
  const PokedexViewProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PokemonsProvider>().catchThenAll();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diletta Pokedex'),
      ),
      body: Consumer<PokemonsProvider>(
        builder: (
          BuildContext context,
          PokemonsProvider instance,
          Widget? child,
        ) {
          if (instance.response == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (instance.response != null) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: instance.response.pokemonListings.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(instance
                              .response.pokemonListings[index].imageURL),
                          Text(instance.response.pokemonListings[index].name)
                        ],
                      ),
                    ),
                  );
                });
          } else if (instance.response == Error) {
            return Center(
              child: Text(instance.response.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
