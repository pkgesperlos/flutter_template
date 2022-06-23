import 'package:flutter/material.dart';

class BigText extends StatelessWidget{
  final String text;
  final TextAlign textAlign;

  BigText(this.text,{this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,style: TextStyle(color: Colors.white,fontSize: 25),textAlign: textAlign, );
  }


}