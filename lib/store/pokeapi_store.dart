import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/models/pokemonList.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi _pokeAPI;
  @computed
  PokeApi get pokeApi => _pokeAPI;

  @observable
  PokemonList pokemonList;

  @observable
  Pokemon pokemon;

  @action
  fetchPokemonList() {
    _pokeAPI = null;
    pokemonList = null;
    loadPokeAPIOfficial().then((value) => pokemonList = value);
    loadPokeAPI().then((value) => _pokeAPI = value);
  }

  @action
  getPokemon({int index}) {
    return _pokeAPI.pokemon[index];
  }

  @action
  Widget getImage({String url}) {
    return CachedNetworkImage(
        placeholder: (context, url) => new Container(color: Colors.transparent),
        imageUrl: url);
  }

  Future<PokeApi> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsApi.pokeapiURL);
      var decodeJson = jsonDecode(response.body);
      return PokeApi.fromJson(decodeJson);
    } catch (error) {
      print('Erro ao carregar lista');
      return null;
    }
  }

  Future<PokemonList> loadPokeAPIOfficial() async {
    try {
      final response =
          await http.get('${ConstsApi.pokeapiOfficialURL}/pokemon');
      var decodedJson = jsonDecode(response.body);
      return PokemonList.fromJson(decodedJson);
    } catch (error) {
      print('Erro ao carregar lista');
      return null;
    }
  }
}
