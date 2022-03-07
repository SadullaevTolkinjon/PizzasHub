import 'package:flutter/foundation.dart';

class NeuMorphismProvider extends ChangeNotifier {
  bool isNotifier = false;
  List notifier = List.generate(4, (index) => false);

  int value = 0;
  void ozgartir(val) {
    value = val;
    notifier[val] = !notifier[val];
    notifyListeners();
  }
}
