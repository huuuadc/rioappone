import 'package:flutter/material.dart';
import 'package:rioappone/provider/constraints_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool a = true;
  Future<void> getStoreThemDarkMode() async {
    SharedPreferences _toggleStatus = await SharedPreferences.getInstance();
    a = _toggleStatus.getBool("toggleDarkStatus") ?? false;
    if (a) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.light;
    }
  }

  //ThemeData _selectThame;

  bool get isDarkMode {
    // getStoreThemDarkMode();
    // debugPrint("Light $a");
    // return a;
    return themeMode == ThemeMode.light;
  }

  Future<void> toggleTheme(bool isOn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool b = prefs.getBool("toggleDarkStatus") ?? false;
    // if (isOn = true) {
    //   themeMode = ThemeMode.dark;
    prefs.setBool("toggleDarkStatus", isOn);
    //   debugPrint("Dark $b $isOn");
    //   isOn = true;
    //   notifyListeners();
    // } else {
    //   themeMode = ThemeMode.light;
    //   prefs.setBool("toggleDarkStatus", false);
    //   debugPrint("Light $isOn");
    //   isOn = false;
    //   notifyListeners();
    // }
    themeMode = isOn ? ThemeMode.light : ThemeMode.light;
    //debugPrint("Light $themeMode $isOn");
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}
