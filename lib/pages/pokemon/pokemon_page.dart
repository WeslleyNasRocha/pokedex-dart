import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/app/app_module.dart';
import 'package:pokedex/store/pokeapi_store.dart';

import 'widgets/rotating_image.dart';

class PokemonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokeApiStore pokeApi = Inject<AppModule>.of().get<PokeApiStore>();
    // PokeApiStore pokeApiStore = PokeApiStore();
    // pokeApiStore.fetchPokemonList();
    double statusHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: [
          Container(
            child: Column(
              children: [
                Container(height: statusHeight, color: Colors.transparent),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16.0, top: 8),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        overflow: Overflow.visible,
                        children: [
                          Positioned(
                              top: -(240 / 2.5),
                              right: -(240 / 2.5),
                              child: RotatingImage(
                                loading: true,
                              )),
                          IconButton(
                            icon: Icon(Icons.list),
                            onPressed: () {},
                          )
                        ],
                      ),
                      (false)
                          ? IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {},
                            )
                          : Container()
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'Pokedex',
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                Expanded(
                  child: Container(child: Observer(
                    builder: (context) {
                      // PokeApi _pokeApi = pokeApiStore.pokeApi;
                      return (true != null)
                          ? AnimationLimiter(
                              child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(16),
                                  addAutomaticKeepAlives: false,
                                  itemCount: 0,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: (200 / 150),
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) =>
                                      AnimationConfiguration.staggeredGrid(
                                          position: index,
                                          columnCount: 2,
                                          duration:
                                              const Duration(milliseconds: 375),
                                          child: ScaleAnimation(
                                            child: ScaleAnimation(
                                                child: GestureDetector(
                                              child: Text("oi"),
                                              // child: PokeItem(
                                              //   pokemon: pokeApiStore
                                              //       .getPokemon(index: index),
                                              // ),
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Container())),
                                            )),
                                          ))))
                          : Container();
                    },
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
