import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app_widget.dart';
import 'package:pokedex/pages/counter/counter_page.dart';
import 'package:pokedex/pages/pokemon/pokemon_page.dart';
import 'package:pokedex/store/counter/counter_store.dart';
import 'package:pokedex/store/pokeapi_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => Counter()), Bind((i) => PokeApiStore)];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (context, args) => CounterPage(),
        ),
        ModularRouter(
          '/pokemon',
          child: (context, args) => PokemonPage(),
        )
      ];

  @override
  Widget get bootstrap => AppWidget();
}
