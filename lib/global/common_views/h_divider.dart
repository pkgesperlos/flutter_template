import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class HDivider extends StatelessWidget{

  final double top;
  final double bottom;


  HDivider({this.top = 0, this.bottom = 0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: top,bottom: bottom),
      child: Container(height: 1,color: Styles.dividerColor,),
    );
  }
}