import 'package:flutter/material.dart';
import 'package:pokemon_bloc/controller/provider/pokemons_provider.dart';
import 'package:pokemon_bloc/view/pokedex_view_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (_) => PokemonsProvider(),
        child: const PokedexViewProvider(),
      ),
    );
  }
}
