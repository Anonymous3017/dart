import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeChecked = true;

  void updateTheme({required bool darkMode}) {
    isDarkModeChecked = darkMode;
    notifyListeners();
  }
}
