import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dot extends StatelessWidget{

  final double size;
  final Color color;

  Dot({this.size = 8, this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
      child: Container(
        width: size,
        height: size,
        color: color,
      ),
    );
  }

}