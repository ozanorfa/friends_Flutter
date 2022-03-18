import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.text, @required this.onPressed, this.iconData});

  final String text;
  final Function onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(text),
      icon: Icon(iconData),
      onPressed: onPressed,
      style: ButtonStyle(
          padding: setPadding(),
          alignment: Alignment.center,
          elevation: MaterialStateProperty.all(3)),
    );
  }

  MaterialStateProperty<EdgeInsets> setPadding() {
    double horizontal = 30;
    double vertical = 18;

    if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      horizontal = 60;
      vertical = 30;
    }

    return MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical));
  }
}
