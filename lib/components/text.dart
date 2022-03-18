import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({this.text, this.textAlign, this.textStyle});

  final String text;
  final TextAlign textAlign;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        maxLines: 3,
        textAlign: textAlign,
        style: textStyle,
      ),
    );
  }
}
