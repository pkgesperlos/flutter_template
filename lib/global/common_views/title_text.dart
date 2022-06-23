import 'package:flutter/material.dart';
import '../../constants/dims.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final bool bold;
  final bool singleLine;
  final bool useLineThrough;
  TitleText(this.text,
      {this.textAlign = TextAlign.center,
        this.textColor = Colors.black,
        this.bold = false,
        this.singleLine = false}):useLineThrough = false;

  TitleText.advanced(this.text,
      {this.textAlign = TextAlign.center,
        this.textColor = Colors.black,
        this.bold = false,
        this.singleLine = false,
        this.useLineThrough = false,

      });


  @override
  Widget build(BuildContext context) {





    return Text(
      text,
      textDirection: TextDirection.rtl,
      maxLines: singleLine?1:null,
      overflow: singleLine?TextOverflow.ellipsis:null,
      style: TextStyle(
          overflow: singleLine?TextOverflow.ellipsis:TextOverflow.visible,
        decoration: useLineThrough?TextDecoration.lineThrough:null,
          color: textColor,
          fontWeight: bold ? FontWeight.bold : null,
          fontSize: Dims.titleFontSize(context)),
      textAlign: textAlign,
    );
  }
}
