import 'package:flutter/foundation.dart';

class FavoriteProvider extends ChangeNotifier {
  List isFavorite = List.generate(13, (index) => false);
  List isFavoriteDesert = List.generate(20, (index) => false);

  void changeFavorite(int index) {
    isFavorite[index] = !isFavorite[index];
    notifyListeners();
  }

  void changeFavoriteDesert(int index) {
    isFavoriteDesert[index] = !isFavoriteDesert[index];
    notifyListeners();
  }
}
