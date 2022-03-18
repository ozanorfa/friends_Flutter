import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:panpisler_voices/components/reusable_card.dart';
import 'package:panpisler_voices/components/text.dart';
import 'package:panpisler_voices/listScreen/list.dart';
import 'package:panpisler_voices/models/panpis_model.dart';
import 'package:panpisler_voices/util/constants.dart';
import 'package:panpisler_voices/util/shared.dart';

final _random = new Random();
int minCan = 5;
int maxCan = 30;
ConfettiController controllerTopCenter;

class WarScreen extends StatefulWidget {
  const WarScreen({this.enemyPanpis});

  final Panpis enemyPanpis;

  WarScreenState createState() => WarScreenState();
}

class WarScreenState extends State<WarScreen> {
  Panpis yourPanpis;
  int yourHealth = 100;
  int enemyHealth = 100;

  @override
  void initState() {
    super.initState();

    if (widget.enemyPanpis.name == "Cem Milan") {
      enemyHealth = 120;
    }

    yourPanpis = panpisList.where((x) => x.name == sharedName).toList().first;
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kawga Dövüj"),
      ),
      body: ReusableCard(
        colour: kPrimaryColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 1 / 4,
                      maxWidth: MediaQuery.of(context).size.width * 1 / 4),
                  child: Image.asset(
                    yourPanpis.ppName,
                    alignment: Alignment.center,
                  ),
                ),
                CustomText(
                  text: "VS",
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 1 / 4,
                      maxWidth: MediaQuery.of(context).size.width * 1 / 4),
                  child: Hero(
                    tag: "panpisImaj" + widget.enemyPanpis.name,
                    child: Image.asset(
                      widget.enemyPanpis.ppName,
                      alignment: Alignment.center,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: "Sağlık: " + yourHealth.toString().trim(),
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                        color: getUserHealthBarColour(),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                CustomText(
                    text: "Sağlık: " + enemyHealth.toString().trim(),
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                        color: getEnemyHealthBarColour(),
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        attackEnemy(1);
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.sports_mma,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: CustomText(
                          text: "Saldırı",
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        attackEnemy(1.2);
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.star,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: CustomText(
                          text: "Süper Saldırı",
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        runEnemy();
                      },
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.airplanemode_active,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: CustomText(
                          text: "Kaç",
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void attackEnemy(double attackConstant) {
    int gidenCan = minCan + _random.nextInt(maxCan - minCan);
    var result = attackEvent(
        yourPanpis.savasPuani, widget.enemyPanpis.savunmaPuani, attackConstant);

    setState(() {
      if (result) {
        enemyHealth = (enemyHealth - (gidenCan * attackConstant).toInt());
      } else {
        yourHealth = (yourHealth - (gidenCan * attackConstant).toInt());
      }

      if (yourHealth <= 0) {
        yourHealth = 0;

        showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (c) => WillPopScope(
            onWillPop: () {},
            child: AlertDialog(
              title: Text('Aga B!'),
              content: Text('Kaybettin'),
              actions: [
                ElevatedButton(
                    child: Text('Napim'),
                    onPressed: () {
                      Route route =
                          MaterialPageRoute(builder: (context) => ListScreen());
                      Navigator.pushAndRemoveUntil(
                          context, route, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    )),
                ElevatedButton(
                  child: Text('Sağlık Olsun'),
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => ListScreen());
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (enemyHealth <= 0) {
        enemyHealth = 0;

        controllerTopCenter.play();

        showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (c) => WillPopScope(
            onWillPop: () {},
            child: AlertDialog(
              title: Text('Tebrikler!'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Kazandınn'),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: buildConfettiWidget(controllerTopCenter, pi / 1),
                  ),
                  buildConfettiWidget(controllerTopCenter, pi / 4),
                ],
              ),
              actions: [
                ElevatedButton(
                    child: Text('Thankss'),
                    onPressed: () {
                      Route route =
                          MaterialPageRoute(builder: (context) => ListScreen());
                      Navigator.pushAndRemoveUntil(
                          context, route, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    )),
              ],
            ),
          ),
        );

        panpisList
            .where((x) => x.name == widget.enemyPanpis.name)
            .toList()
            .first
            .isBeaten = true;
      }
    });
  }

  void runEnemy() {
    showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('Uyarı!'),
        content: Text('Harbi kaçıyor musun?'),
        actions: [
          ElevatedButton(
            child: Text('Hayır'),
            onPressed: () {
              Navigator.pop(c, false);
            },
          ),
          ElevatedButton(
            child: Text('Maalsf'),
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (context) => ListScreen());
              Navigator.pushAndRemoveUntil(context, route, (route) => false);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  getUserHealthBarColour() {
    if (yourHealth > 70) {
      return Colors.white;
    } else if (yourHealth > 50) {
      return Colors.yellow;
    } else if (yourHealth > 25) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  getEnemyHealthBarColour() {
    if (enemyHealth > 70) {
      return Colors.white;
    } else if (enemyHealth > 50) {
      return Colors.yellow;
    } else if (enemyHealth > 25) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.directional,
        maxBlastForce: 20, // set a lower max blast force
        minBlastForce: 8, // set a lower min blast force
        emissionFrequency: 1, // a lot of particles at once
        gravity: 1,
      ),
    );
  }
}
