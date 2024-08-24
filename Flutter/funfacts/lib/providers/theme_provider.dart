import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeChecked = true;

  void updateTheme({required bool darkMode}) async {
    isDarkModeChecked = darkMode;

    //Obtain share4d preferences and save the theme mode
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //Save the theme mode to shared preferences
    prefs.setBool('darkMode', darkMode);
    notifyListeners();
  }

  void getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkModeChecked = prefs.getBool('darkMode') ?? true;
    notifyListeners();
  }
}
