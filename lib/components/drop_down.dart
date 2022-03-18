import 'package:flutter/material.dart';
import 'package:panpisler_voices/components/text.dart';
import 'package:panpisler_voices/models/panpis_model.dart';
import 'package:panpisler_voices/util/constants.dart';

class DropDown extends StatefulWidget {
  String dropdownValue;
  var thePanpis = Panpis("", "", "0", "0", false);

  DropDown(this.dropdownValue);

  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State<DropDown> {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton<String>(
              dropdownColor: kPrimaryColor,
              value: widget.dropdownValue,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.white, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String data) {
                setState(() {
                  if (data.isNotEmpty) {
                    widget.thePanpis =
                        panpisList.where((x) => x.name == data).toList().first;
                  } else {
                    widget.thePanpis = Panpis("", "", "0", "0", false);
                  }
                  widget.dropdownValue = data;
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 28, 8, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_mma,
                    color: kIconColor,
                    size: 35.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomText(
                      text: "Savaş Puanı: " + widget.thePanpis.savasPuani,
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.sports_mma,
                    color: kIconColor,
                    size: 35.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shield,
                    color: kIconColor,
                    size: 35.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomText(
                      text: "Savunma Puanı: " + widget.thePanpis.savunmaPuani,
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.shield,
                    color: kIconColor,
                    size: 35.0,
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
