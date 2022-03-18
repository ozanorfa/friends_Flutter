import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panpisler_voices/components/reusable_card.dart';
import 'package:panpisler_voices/models/settings_model.dart';
import 'package:panpisler_voices/util/constants.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingScreen extends StatefulWidget {
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingScreen> {
  String id = "";
  String name = "";
  String surname = "";

  @override
  void initState() {
    super.initState();

    SettingsModel().setupSharedPrefData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsScreen(
        title: "Ayarlar",
        children: [
          ExpandableSettingsTile(
            title: 'Tema',
            subtitle: 'Tema Ayarları',
            children: <Widget>[
              CheckboxSettingsTile(
                settingKey: 'key-day-light-savings',
                title: 'Pil tasarrufu',
                enabledLabel: 'Açık',
                disabledLabel: 'Kapalı',
                leading: Icon(Icons.timelapse),
                onChange: (value) {
                  debugPrint('key-day-light-savings: $value');
                },
              ),
              SwitchSettingsTile(
                  settingKey: 'key-dark-mode',
                  title: 'Dark Mode',
                  enabledLabel: 'Açık',
                  disabledLabel: 'Kapalı',
                  leading: Icon(Icons.palette),
                  onChange: (value) {
                    debugPrint('key-dark-mode: $value');
                  }),
            ],
          ),
          DropDownSettingsTile<int>(
            title: 'Zorluk',
            settingKey: 'key-dropdown-zorluk',
            values: <int, String>{
              1: 'Kolay',
              2: 'Orta',
              3: 'Zor',
            },
            selected: 2,
            onChange: (value) {
              debugPrint('key-dropdown-zorluk: $value');
            },
          ),
          SliderSettingsTile(
            title: 'Volume',
            settingKey: 'key-slider-volume',
            defaultValue: 20,
            min: 0,
            max: 100,
            step: 1,
            leading: Icon(Icons.volume_up),
            onChange: (value) {
              debugPrint('key-slider-volume: $value');
            },
          )
        ],
      ),
    );
  }

  void updateUI(dynamic hesData) {
    setState(() {
      if (hesData == null) {
        resetUI();
      } else {
        /*hesData[healthStatus] == riskless
            ? hResultType = HesResultType.noRisk
            : hResultType = HesResultType.hasRisk;
        id = hesData[idNumber];
        name = hesData[firstName];
        surname = hesData[lastname];*/
      }
    });
  }

  void resetUI() {
    //hResultType = HesResultType.noData;
    id = "";
    name = "";
    surname = "";
  }
}
