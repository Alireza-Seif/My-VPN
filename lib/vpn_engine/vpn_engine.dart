import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_vpn/models/vpn_configuration.dart';
import 'package:my_vpn/models/vpn_status.dart';

class VpnEngine {
  //native channel
  static const String eventChannelVpnStage = 'vpnStage';
  static const String eventChannelVpnStatus = 'vpnStatus';
  static const String methodChannelVpnControl = 'vpnControl';

//vpn connection stage snapshot
  static Stream<String> snapshotVpnStage() =>
      const EventChannel(eventChannelVpnStage).receiveBroadcastStream().cast();

//vpn connection status snapshot
  static Stream<VpnStatus?> snapshotVpnStatus() =>
      const EventChannel(eventChannelVpnStatus)
          .receiveBroadcastStream()
          .map((eventStatus) => VpnStatus.fromJson(jsonDecode(eventStatus)))
          .cast();

  static Future<void> startVpnNow(VpnConfiguration vpnConfiguration) async {
    return const MethodChannel(methodChannelVpnControl).invokeMethod('start', {
      'config': vpnConfiguration.config,
      'country': vpnConfiguration.countryName,
      'username': vpnConfiguration.userName,
      'password': vpnConfiguration.password,
    });
  }

  static Future<void> stopVpnNow() {
    return const MethodChannel(methodChannelVpnControl)
        .invokeListMethod('stop');
  }
}
