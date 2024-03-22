import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_vpn/all_controllers/controller_vpn_location.dart';

class AvailableVpnServersLocation extends StatelessWidget {
  AvailableVpnServersLocation({super.key});

  final vpnLocationController = ControllerVPNLocation();

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
                : vpnAvailableServersData,
      ),
    );
  }
}
