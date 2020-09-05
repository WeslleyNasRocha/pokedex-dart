import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                              child: Opacity(
                                child: Image.asset(
                                  ConstsApp.pokeballBlack,
                                  height: 240,
                                  width: 240,
                                ),
                                opacity: 0.1,
                              )),
                          IconButton(
                            icon: Icon(Icons.list),
                            onPressed: () {},
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {},
                      )
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
                  child: Container(
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('Pokemon'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
