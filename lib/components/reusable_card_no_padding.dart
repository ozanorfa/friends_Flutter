import 'package:flutter/material.dart';

class ReusableCardNoPadding extends StatelessWidget {
  ReusableCardNoPadding({this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: cardChild,
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 0)),
          ]),
    );
  }
}
