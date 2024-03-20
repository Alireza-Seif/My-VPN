import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_vpn/app_preferences/app_preferences.dart';
import 'package:my_vpn/models/vpn_info.dart';
import 'package:http/http.dart' as http;

class ApiVpnGate {
  static Future<List<VpnInfo>> retrieveAllAvailableVpnFreeServers() async {
    final List<VpnInfo> vpnServersList = [];

    try {
      final responseFromApi =
          await http.get(Uri.parse('http://www.vpngate.net/api/iphone/'));
      final commaSeparatedValueString =
          responseFromApi.body.split('#')[1].replaceAll('*', '');
      List<List<dynamic>> listData =
          const CsvToListConverter().convert(commaSeparatedValueString);

      final header = listData[0];

      for (int counter = 1; counter < listData.length - 1; counter++) {
        Map<String, dynamic> jsonData = {};
        for (int innerCounter = 1;
            innerCounter < header.length;
            innerCounter++) {
          jsonData.addAll({
            header[innerCounter].toString(): listData[counter][innerCounter]
          });
        }
        vpnServersList.add(VpnInfo.fromJson(jsonData));
      }
    } catch (errorMsg) {
      Get.snackbar('Error Occurred', errorMsg.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent.withOpacity(.8));
    }
    vpnServersList.shuffle();

    if (vpnServersList.isNotEmpty) AppPreferences.vpnList = vpnServersList;
    return vpnServersList;
  }
}
