import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:pizzadeeserts/model/bascet_model.dart';

class BoxAddtoBascet extends ChangeNotifier {
  Box bascetBox = Hive.box("bascets");
  void malumotQosh(var data) {
    bascetBox.add(data);
    notifyListeners();
  }

  void ochiribTasha(int index) {
    bascetBox.delete(index);
    notifyListeners();
  }
}
