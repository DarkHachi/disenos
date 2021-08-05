import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(children:[
      _IconHeaderBackground(),
      Positioned(
        top: -50,
        left: -70,
        child: FaIcon(FontAwesomeIcons.plus, size: 250, color: Colors.white.withOpacity(0.2),)
      ),
    ] );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff526bf6),
            Color(0xff67acf2),
          ]
        )
      )
    );
  }
}