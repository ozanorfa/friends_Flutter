import 'package:flutter/material.dart';
import 'package:panpisler_voices/chatScreen/chat.dart';
import 'package:panpisler_voices/components/list_view.dart';
import 'package:panpisler_voices/components/reusable_card.dart';
import 'package:panpisler_voices/components/text.dart';
import 'package:panpisler_voices/models/panpis_model.dart';
import 'package:panpisler_voices/util/constants.dart';
import 'package:panpisler_voices/util/shared.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListScreen extends StatefulWidget {
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();

    /*for (var i = 0; i < panpisList.length; i++) {
      if ((sharedName.trim() != panpisList[i].name.trim()) &&
          panpisList[i].name.trim() != "Cem Milan" &&
          !panpisList[i].isBeaten) {
        
        break;
      }
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () async {
                goBack();
              },
            ),
            IconButton(
                onPressed: () async {
                  passToChatScreen();
                },
                icon: Icon(
                  Icons.chat_rounded,
                  color: Colors.white,
                )),
          ],
          title: Text(
            appBarTitle,
            style: kLabelTextStyle,
          ),
        ),
        body: ReusableCard(
            colour: kPrimaryColor,
            cardChild: CustomListView(
              text: "Rakibini seç",
            )),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Uyarı!'),
          content: Text('Çıkış yapmak istiyor musunuz?'),
          actions: [
            ElevatedButton(
              child: Text('Hayır'),
              onPressed: () => Navigator.pop(c, false),
            ),
            ElevatedButton(
              child: Text('Hayır ama yeşil'),
              onPressed: () => Navigator.pop(c, false),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goBack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedNameTxt, "");

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  passToChatScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(),
      ),
    );
  }
}
