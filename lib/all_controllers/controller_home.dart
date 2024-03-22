import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_vpn/app_preferences/app_preferences.dart';
import 'package:my_vpn/models/vpn_configuration.dart';
import 'package:my_vpn/models/vpn_info.dart';
import 'package:my_vpn/vpn_engine/vpn_engine.dart';

class ControllerHome extends GetxController {
  final Rx<VpnInfo> vpnInfo = AppPreferences.vpnInfoObj.obs;

  final vpnConnectionState = VpnEngine.vpnDisconnectedNow.obs;

  void connectToVpnNow() async {
    if (vpnInfo.value.base64OpenVPNConfigurationData.isEmpty) {
      Get.snackbar(
          'Country / Location', 'please select country / location first.');

      return;
    }
    
    //disconnected
    if (vpnConnectionState.value == VpnEngine.vpnDisconnectedNow) {
      final dataConfigVpn =
          const Base64Decoder().convert(vpnInfo.value.base64OpenVPNConfigurationData);
      final configuration = const Utf8Decoder().convert(dataConfigVpn);

      final vpnConfiguration = VpnConfiguration(
          userName: 'vpn',
          password: 'vpn',
          countryName: vpnInfo.value.countryLongName,
          config: configuration);

      await VpnEngine.startVpnNow(vpnConfiguration);
    } else {
      await VpnEngine.stopVpnNow();
    }
  }

  Color get getRoundVpnButtonColor {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return Colors.redAccent;

      case VpnEngine.vpnConnectedNow:
        return Colors.greenAccent;

      default:
        return Colors.orangeAccent;
    }
  }

  String get getRoundVpnButtonText {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return "Let's  Connect";

      case VpnEngine.vpnConnectedNow:
        return 'Disconnect';

      default:
        return 'Connecting...';
    }
  }
}
