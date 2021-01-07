import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';

import 'cached_image.dart';
import 'type_tag.dart';

class PokeItem extends StatelessWidget {
  final Pokemon pokemon;

  PokeItem({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: ConstsApi.getColorType(type: pokemon.type[0]),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        bottom: -30,
                        right: -30,
                        height: 120,
                        child: Opacity(
                            opacity: 0.4,
                            child: Image.asset(ConstsApp.pokeballWhite)),
                      ),
                      Positioned(
                        height: 80,
                        child: CachedImage(
                          pokemonNumber: pokemon.num,
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Opacity(
                    opacity: 0.4,
                    child: Text('#${pokemon.num}',
                        style: TextStyle(fontFamily: 'NotoSans', fontSize: 16)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        pokemon.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'NotoSans'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TypeTag(typeList: pokemon.type),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
