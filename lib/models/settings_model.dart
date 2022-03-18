import 'package:panpisler_voices/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

const city = 'Antalya';
const town = 'Merkez';

class SettingsModel {
  static String cityName = city;
  static String townName = town;

  Future<void> setupSharedPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cityName = prefs.getString(cityTxt);
    townName = prefs.getString(townTxt);

    if (cityName == null || cityName.isEmpty) cityName = city;
    if (townName == null || townName.isEmpty) townName = town;

    await prefs.setString(cityTxt, cityName);
    await prefs.setString(townTxt, townName);
  }

  Future<void> setSharedPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(cityTxt, cityName);
    await prefs.setString(townTxt, townName);
  }
}
