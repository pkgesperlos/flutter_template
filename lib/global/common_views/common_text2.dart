import 'package:flutter/material.dart';

class CommonText2 extends StatelessWidget{
  final String text;
  final TextAlign textAlign;

  CommonText2(this.text,{this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,style: Theme.of(context).textTheme.bodyText2,textAlign: textAlign, );
  }


}