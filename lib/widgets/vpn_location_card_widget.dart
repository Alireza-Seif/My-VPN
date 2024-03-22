import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_vpn/all_controllers/controller_home.dart';
import 'package:my_vpn/app_preferences/app_preferences.dart';
import 'package:my_vpn/main.dart';
import 'package:my_vpn/models/vpn_info.dart';

class VpnLocationCard extends StatelessWidget {
  VpnLocationCard({super.key, required this.vpnInfo});

  final VpnInfo vpnInfo;

  String formatSpeedBytes(int speedBytes, int decimals) {
    if (speedBytes <= 0) {
      return '0 B';
    }
    const suffixesTitle = ['Bps', 'Kbps', 'Mbps', 'Gbps', 'Tbps'];

    var speedTitleIndex = (log(speedBytes) / log(1024)).floor();

    return '${(speedBytes / pow(1024, speedTitleIndex)).toStringAsFixed(decimals)} ${suffixesTitle[speedTitleIndex]}';
  }

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    final homeController = Get.find<ControllerHome>();
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: sizeScreen.height * .01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          //country flag
          leading: Container(
            padding: const EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              'assets/images/countryFlags/${vpnInfo.countryShortName.toLowerCase()}.png',
              height: 40,
              width: sizeScreen.width * .15,
              fit: BoxFit.cover,
            ),
          ),

          //counnnntry name
          title: Text(vpnInfo.countryLongName),

          //vpn speed
          subtitle: Row(
            children: [
              const Icon(
                Icons.shutter_speed,
                color: Colors.redAccent,
                size: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                formatSpeedBytes(vpnInfo.speed, 2),
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
          //number of sessions
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                vpnInfo.vpnSessionsNum.toString(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).lightTextColor),
              ),
              const SizedBox(
                width: 4,
              ),
              const Icon(
                CupertinoIcons.person_2_alt,
                color: Colors.redAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
