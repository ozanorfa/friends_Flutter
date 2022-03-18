import 'package:flutter/material.dart';
import 'package:panpisler_voices/components/button.dart';
import 'package:panpisler_voices/components/reusable_card.dart';
import 'package:panpisler_voices/components/text.dart';
import 'package:panpisler_voices/models/panpis_model.dart';
import 'package:panpisler_voices/util/constants.dart';
import 'package:panpisler_voices/warScreen/war_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen();

  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  Panpis panpis;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PanpisModelProvider>(
      builder: (context, value, child) {
        panpis = value.getPanpis();
        return Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
          ),
          body: ReusableCard(
            colour: kPrimaryColor,
            cardChild: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 2 / 5),
                        child: Hero(
                          tag: "panpisImaj" + panpis.name,
                          child: Image.asset(panpis.ppName,
                              alignment: Alignment.center),
                        )),
                    CustomText(
                        text: panpis.name,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800)),
                    CustomText(
                        text: "Savaş Puanı " + panpis.savasPuani,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
                    CustomText(
                        text: "Savunma Puanı " + panpis.savunmaPuani,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                              child: CustomButton(
                                  text: "Saldır",
                                  onPressed: () {
                                    attackScreen();
                                  },
                                  iconData: Icons.alarm),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: CustomButton(
                                  text: "Arazi Ol",
                                  onPressed: () {
                                    listScreen();
                                  },
                                  iconData: Icons.directions_walk_outlined),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  attackScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WarScreen(enemyPanpis: panpis),
      ),
    );
  }

  listScreen() {
    Navigator.pop(context);
  }
}
