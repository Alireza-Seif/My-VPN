import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_vpn/all_controllers/controller_vpn_location.dart';
import 'package:my_vpn/widgets/loading_ui_widget.dart';
import 'package:my_vpn/widgets/no_vpn_server_found_ui_widget.dart';

class AvailableVpnServersLocation extends StatelessWidget {
  AvailableVpnServersLocation({super.key});

  final vpnLocationController = ControllerVPNLocation();

vpnAvailableServersData() {
  return ListView.builder(itemCount: vpnLocationController.vpnFreeServersAvailableList.length,
  physics: BouncingScrollPhysics(),padding: EdgeInsets.all(3),
  itemBuilder: ((context, index) {
    
  }),);
}
 
  @override
  Widget build(BuildContext context) {
    if (vpnLocationController.vpnFreeServersAvailableList.isEmpty) {
      vpnLocationController.retrieveVpnInformation();
    }
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            'VPN Locations (${vpnLocationController.vpnFreeServersAvailableList.length})',
          ),
        ),
        body: vpnLocationController.isLoadingNewLocations.value
            ? loadingUIWidget()
            : vpnLocationController.vpnFreeServersAvailableList.isEmpty
                ? noVpnServerFoundUIWidget()
                : vpnAvailableServersData(),
      ),
    );
  }
}
