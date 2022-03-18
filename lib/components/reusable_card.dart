import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: cardChild,
      padding: EdgeInsets.fromLTRB(10, 12, 10, 5),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 0)),
          ]),
    );
  }
}
