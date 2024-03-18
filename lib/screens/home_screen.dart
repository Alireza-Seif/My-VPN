import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_vpn/app_preferences/app_preferences.dart';
import 'package:my_vpn/main.dart';
import 'package:my_vpn/widgets/down_up_line.dart';
import 'package:my_vpn/widgets/location_ping_line.dart';
import 'package:my_vpn/widgets/vpn_round_button.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});



  locationSelectionBottomNavigation(BuildContext context) {
    return SafeArea(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: () {},
          child: Container(
            color: Colors.teal,
            padding: EdgeInsets.symmetric(horizontal: sizeScreen.width * .04),
            height: 62,
            child: const Row(
              children: [
                Icon(
                  CupertinoIcons.flag_circle,
                  color: Colors.white,
                  size: 36,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Select Country / Location',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.redAccent,
                    size: 26,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text('My Free VPN'),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
        actions: [
          IconButton(
              onPressed: () {
                Get.changeThemeMode(AppPreferences.isModeDark
                    ? ThemeMode.light
                    : ThemeMode.dark);

                AppPreferences.isModeDark = !AppPreferences.isModeDark;
              },
              icon: const Icon(Icons.brightness_2_outlined)),
        ],
      ),
      bottomNavigationBar: locationSelectionBottomNavigation(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 2 round widget
          // location _ ping
           LPLine(),

          // button for vpn
          VpnRoundButton(),

          // 2 round widget
          //dowload + ping
           DULine(),
        ],
      ),
    );
  }
}
