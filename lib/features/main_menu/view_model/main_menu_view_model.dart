import 'package:flutter/foundation.dart';

class MainMenuViewModel extends ChangeNotifier {
  int selectedMenuItem = 0;

  void changeMenuItem(int index) {
    selectedMenuItem = index;
    notifyListeners();
  }
}
