import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_vpn/app_preferences/app_preferences.dart';
import 'package:my_vpn/screens/home_screen.dart';


late Size sizeScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreferences.initHive();

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
      home:  HomeScreen(),
    );
  }
}
