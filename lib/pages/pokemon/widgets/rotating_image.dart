import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:supercharged/supercharged.dart';
import 'package:simple_animations/simple_animations.dart';

class RotatingImage extends StatefulWidget {
  final bool loading;
  RotatingImage({Key key, this.loading}) : super(key: key);

  @override
  _RotatingImageState createState() => _RotatingImageState();
}

class _RotatingImageState extends State<RotatingImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Opacity(
        child: CustomAnimation<double>(
            control: widget.loading
                ? CustomAnimationControl.LOOP
                : CustomAnimationControl.PLAY,
            tween: 0.0.tweenTo(360.0),
            builder: (context, child, value) {
              return Transform.rotate(
                angle: widget.loading ? value : 0,
                child: child,
              );
            },
            duration: 60.seconds,
            child: Image.asset(
              ConstsApp.pokeballBlack,
              height: 240,
              width: 240,
            )),
        opacity: 0.1,
      ),
    );
  }
}
