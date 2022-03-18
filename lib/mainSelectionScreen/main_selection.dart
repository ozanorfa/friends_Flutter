import 'package:flutter/material.dart';
import 'package:panpisler_voices/components/button.dart';
import 'package:panpisler_voices/components/reusable_card.dart';
import 'package:panpisler_voices/components/text.dart';
import 'package:panpisler_voices/models/panpis_model.dart';
import 'package:panpisler_voices/util/constants.dart';
import 'package:panpisler_voices/warScreen/war_screen.dart';

class MainSelectionScreen extends StatefulWidget {
  const MainSelectionScreen({this.panpis});

  final Panpis panpis;

  SelectionScreenState createState() => SelectionScreenState();
}

class SelectionScreenState extends State<MainSelectionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: ReusableCard(colour: kPrimaryColor, cardChild: Text("sdfs")),
    );
  }
}
