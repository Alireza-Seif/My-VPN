import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_vpn/appPreferences/app_preferences.dart';
import 'package:my_vpn/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppPreferences.initHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My VPN',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 3),
      ),
      themeMode: AppPreferences.isModeDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(centerTitle: true, elevation: 3)),
      home: const HomeScreen(),
    );
  }
}
