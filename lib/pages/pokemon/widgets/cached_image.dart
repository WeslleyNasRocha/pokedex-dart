import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String pokemonNumber;
  const CachedImage({Key key, this.pokemonNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        placeholder: (context, url) => new Container(color: Colors.transparent),
        imageUrl:
            'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$pokemonNumber.png');
  }
}
