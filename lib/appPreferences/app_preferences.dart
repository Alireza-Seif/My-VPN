import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppPreferences 
{
  static late Box boxOfData;

  static Future<void> initHive() async {

    await Hive.initFlutter();

    boxOfData = await Hive.openBox('data'); 
  }

  //saving user choice about theme selection
  static bool get isModeDark => boxOfData.get('isModeDark') ?? false;
  static set isModeDark(bool value) => boxOfData.put('isModeDark', value); 
}


extension AppTheme on ThemeData{
  Color get lightTextColor => AppPreferences.isModeDark ? Colors.white70 : Colors.black54;
  Color get bottomNavigationColor => AppPreferences.isModeDark ? Colors.white12 : Colors.redAccent;
}