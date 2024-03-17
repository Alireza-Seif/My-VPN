import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_vpn/models/vpn_configuration.dart';
import 'package:my_vpn/models/vpn_status.dart';

class VpnEngine {
  //native channel
  static final String eventChannelVpnStage = 'vpnStage';
  static final String eventChannelVpnStatus = 'vpnStatus';
  static final String methodChannelVpnControl = 'vpnControl';

//vpn connection stage snapshot
  static Stream<String> snapshotVpnStage() =>
      EventChannel(eventChannelVpnStage).receiveBroadcastStream().cast();

//vpn connection status snapshot
  static Stream<VpnStatus?> snapshotVpnStatus() =>
      EventChannel(eventChannelVpnStatus)
          .receiveBroadcastStream()
          .map((eventStatus) => VpnStatus.fromJson(jsonDecode(eventStatus)))
          .cast();

  static Future<void> startVpnNow(VpnConfiguration vpnConfiguration) async {
    return MethodChannel(methodChannelVpnControl).invokeMethod('start', 
    {
      'config': vpnConfiguration.config,
      'country': vpnConfiguration.countryName,
      'username': vpnConfiguration.userName,
      'password': vpnConfiguration.password,
    });
  }

  static Future<void> stopVpnNow() {
    return MethodChannel(methodChannelVpnControl).invokeListMethod('stop');
  }

  static Future<void> killSwitchOpenNow() {
    return MethodChannel(methodChannelVpnControl)
        .invokeListMethod('kill_switch');
  }

  static Future<void> refreshStageNow() {
    return MethodChannel(methodChannelVpnControl).invokeListMethod('refresh');
  }

  static Future<String?> getStageNow() {
    return MethodChannel(methodChannelVpnControl).invokeMethod('stage');
  }

  static Future<bool> isConnectedNow() {
    return getStageNow()
        .then((valueStage) => valueStage!.toLowerCase() == 'connected');
  }

  //stages of vpn connection
  static const String vpnConnectedNow = 'connected';
  static const String vpnDisconnectedNow = 'disconnected';
  static const String vpnWaitConnectionNow = 'wait_connection';
  static const String vpnAuthenticatingNow = 'authenticating';
  static const String vpnReconnectNow = 'reconnect';
  static const String vpnNoConnectionNow = 'no_connection';
  static const String vpnConnectingNow = 'connection';
  static const String vpnPrepareNow = 'prepare';
  static const String vpnDeniedNow = 'denied';
}
