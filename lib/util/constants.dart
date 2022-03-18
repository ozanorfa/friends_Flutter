import 'dart:math';

import 'package:flutter/material.dart';
import 'package:panpisler_voices/models/panpis_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const appBarTitle = 'PANPİŞLER';

const kPrimaryColor = Colors.green;
const kIconColor = Color(0xff0000ff);

const sharedNameTxt = 'shared_name';

const kLabelTextStyle = TextStyle(
  color: Colors.white,
);

const cityTxt = 'city';
const townTxt = 'town';
const addressTxt = 'address';
Random r = new Random();

const panpisRoomid = "Panpis_room_1";

List<String> spinnerItems = [
  '',
  'Ozan',
  'Kansu',
  'Ahmet',
  'Aykut',
  'Batuhan',
  "Berkay",
  "Buğra",
  "Cuci",
  "Sinan"
];

List<Panpis> panpisList = [
  Panpis("Ozan", "assets/images/pzan.jpeg", "120", "100", false),
  Panpis("Kansu", "assets/images/kansu.jpeg", "100", "90", false),
  Panpis("Ahmet", "assets/images/ahmet.jpg", "80", "80", false),
  Panpis("Aykut", "assets/images/aykut.jpeg", "65", "75", false),
  Panpis("Batuhan", "assets/images/batus.jpeg", "90", "31", false),
  Panpis("Berkay", "assets/images/berkay.jpeg", "80", "80", false),
  Panpis("Buğra", "assets/images/bugi.jpeg", "60", "55", false),
  Panpis("Cuci", "assets/images/cuci.jpeg", "55", "70", false),
  Panpis("Sinan", "assets/images/sinan.jpeg", "55", "55", false),
  Panpis("Cem Milan", "assets/images/cmilan.jpeg", "170", "200", false)
];

bool attackEvent(
    String attackPoint, String defencePoint, double attackConstant) {
  double falseNumber = 0.5;

  try {
    falseNumber = (int.parse(defencePoint) /
        (int.parse(attackPoint) + int.parse(defencePoint)));
  } catch (e) {
    print(e);
  }

  double falseProbability = falseNumber;
  bool booleanResult = r.nextDouble() > (falseProbability * attackConstant);

  return booleanResult;
}
