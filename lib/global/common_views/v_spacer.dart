import 'package:flutter/material.dart';
import '../../constants/dims.dart';

class VSpacer extends StatelessWidget{

  final bool big;


  VSpacer({this.big = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: big?Dims.bigPadding:Dims.littlePadding,
    );
  }
}