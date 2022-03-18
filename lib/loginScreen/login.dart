import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:panpisler_voices/components/button.dart';
import 'package:panpisler_voices/components/drop_down.dart';
import 'package:panpisler_voices/components/reusable_card.dart';
import 'package:panpisler_voices/components/text.dart';
import 'package:panpisler_voices/listScreen/list.dart';
import 'package:panpisler_voices/mainSelectionScreen/main_selection.dart';
import 'package:panpisler_voices/settingsScreen/settings.dart';
import 'package:panpisler_voices/util/constants.dart';
import 'package:panpisler_voices/util/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var dropDown = DropDown(spinnerItems.first);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitle,
            style: kLabelTextStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                goSet();
              },
            )
          ],
        ),
        body: ReusableCard(
          colour: kPrimaryColor,
          cardChild: Column(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: "loginPersonLeft",
                            child: Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Icon(
                                Icons.person,
                                color: kIconColor,
                                size: 30.0,
                              ),
                            ),
                          ),
                          CustomText(
                              text: "Karakter Seçin",
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          Hero(
                            tag: "loginPersonRight",
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.person,
                                color: kIconColor,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: dropDown,
                      )
                    ],
                  )),
              CustomButton(
                text: "Giriş",
                onPressed: () {
                  checkNameAndGetIn();
                },
                iconData: Icons.login,
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }

  Future<void> checkNameAndGetIn() async {
    String selectedName = dropDown.dropdownValue;

    if (selectedName == null || selectedName.isEmpty) {
      showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Uyarı!'),
          content: Text('Lütfen Karakter Seçiniz!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(sharedNameTxt, selectedName);
      sharedName = selectedName;

      selectedPanpis =
          panpisList.where((x) => x.name == selectedName).toList().first;

      for (int i = 0; i < panpisList.length; i++) {
        panpisList[i].isBeaten = false;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ListScreen();
          },
        ),
      );
    }
  }

  void goSet() {
    Settings.init();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingScreen(),
      ),
    );
  }
}
