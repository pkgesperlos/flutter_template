import 'package:flutter/material.dart';
import '../../constants/dims.dart';

class TitleTextError extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final bool bold;
  final bool singleLine;
  TitleTextError(this.text,
      {this.textAlign = TextAlign.center,
        this.bold = false,
        this.singleLine = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      textDirection: TextDirection.rtl,
      maxLines: singleLine?1:null,
      overflow: singleLine?TextOverflow.ellipsis:null,
      style: TextStyle(
          color: Colors.red,
          fontWeight: bold ? FontWeight.bold : null,
          fontSize: Dims.titleFontSize(context)),
      textAlign: textAlign,
    );
  }
}
