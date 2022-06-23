import 'package:flutter/material.dart';
import '../../constants/dims.dart';

class CommonText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final bool bold;
  final bool singleLine;
  final bool useLineThrough;
  CommonText(this.text,
      {this.textAlign = TextAlign.center,
      this.textColor = Colors.black,
      this.bold = false,
      this.singleLine = false}):useLineThrough = false;

  CommonText.advanced(this.text,
      {this.textAlign = TextAlign.center,
      this.textColor = Colors.black,
      this.bold = false,
      this.singleLine = false,
        this.useLineThrough = false
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      textDirection: TextDirection.rtl,
      style: TextStyle(
          decoration: useLineThrough?TextDecoration.lineThrough:null,
          fontSize: Dims.commonFontSize(context),
          color: textColor,
          fontWeight: bold ? FontWeight.bold : null),
      textAlign: textAlign,
      maxLines: singleLine ? 1 : null,
      overflow: singleLine ? TextOverflow.ellipsis : null,
    );
  }
}
