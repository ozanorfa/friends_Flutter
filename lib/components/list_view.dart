import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:panpisler_voices/components/text.dart';
import 'package:panpisler_voices/detailScreen/detail.dart';
import 'package:panpisler_voices/models/panpis_model.dart';
import 'package:panpisler_voices/util/constants.dart';
import 'package:panpisler_voices/util/shared.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomListView extends StatelessWidget {
  CustomListView({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final panpisProv = Provider.of<PanpisModelProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          child: Row(
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
                text: text,
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
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
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 3.8 / 5,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: panpisList.length,
            itemBuilder: (_, i) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                child: Card(
                  child: ListTile(
                    leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 70,
                          minHeight: 80,
                        ),
                        child: Hero(
                            tag: "panpisImaj" + panpisList[i].name,
                            child: Image.asset(panpisList[i].ppName))),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 3, 42, 3),
                      child: CustomText(
                        text: panpisList[i].name,
                        textAlign: TextAlign.center,
                        textStyle: TextStyle(color: Colors.green),
                      ),
                    ),
                    onTap: () async {
                      bool stillEnemy = false;
                      for (var i = 0; i < panpisList.length; i++) {
                        if ((sharedName.trim() != panpisList[i].name.trim()) &&
                            panpisList[i].name.trim() != "Cem Milan" &&
                            !panpisList[i].isBeaten) {
                          stillEnemy = true;
                          break;
                        }
                      }

                      if (sharedName.trim() == panpisList[i].name.trim()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Ooo pampa kendini mi dövcen"),
                        ));
                      } else if ((panpisList[i].name.trim() == "Cem Milan" &&
                              stillEnemy) &&
                          !kDebugMode) {
                        showDialog<bool>(
                          context: context,
                          builder: (c) => AlertDialog(
                            title: Text('Uyarı!'),
                            content: Text(
                                'Kilitli Boss\n\nBu karakter ile mücadele edemezsin.'),
                            actions: [
                              ElevatedButton(
                                child: Text('Tamam'),
                                onPressed: () => Navigator.pop(c, false),
                              ),
                            ],
                          ),
                        );
                      } else {
                        panpisProv.setPanpis(panpisList[i]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(),
                          ),
                        );
                      }
                      print(panpisList[i].name);
                    },
                    trailing: Icon(
                      getIconData(panpisList[i]),
                      color: kPrimaryColor,
                      size: 35.0,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  IconData getIconData(Panpis panpisim) {
    var icon = Icons.cloud_rounded;

    if (sharedName.trim() == panpisim.name.trim()) {
      icon = Icons.person;
    } else if (panpisim.isBeaten) {
      icon = Icons.cloud_done;
    }

    return icon;
  }
}
