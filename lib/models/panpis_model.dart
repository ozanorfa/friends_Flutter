import 'package:flutter/material.dart';

class Panpis {
  final String name;
  final String ppName;
  final String savasPuani;
  final String savunmaPuani;
  bool isBeaten = false;

  Panpis(this.name, this.ppName, this.savasPuani, this.savunmaPuani,
      this.isBeaten);
}

class PanpisModelProvider extends ChangeNotifier {
  Panpis panpisim = Panpis("", "", "", "", false);

  void setPanpis(Panpis panpis) {
    panpisim = panpis;
    notifyListeners();
  }

  Panpis getPanpis() {
    return panpisim;
  }
}
