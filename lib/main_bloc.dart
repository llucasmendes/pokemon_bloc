import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_bloc/controller/bloc/pokemons_bloc.dart';
import 'package:pokemon_bloc/view/pokedex_view_bloc.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokemonsBloc()
              ..add(
                PokemonsPageRequest(page: 0),
              ),
          )
        ],
        child: const PokedexViewBloc(),
      ),
    );
  }
}
