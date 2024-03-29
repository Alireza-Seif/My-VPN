import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_vpn/all_controllers/controller_vpn_location.dart';
import 'package:my_vpn/widgets/loading_ui_widget.dart';
import 'package:my_vpn/widgets/no_vpn_server_found_ui_widget.dart';
import 'package:my_vpn/widgets/vpn_available_servers_data.dart';

class AvailableVpnServersLocationScreen extends StatelessWidget {
  AvailableVpnServersLocationScreen({super.key});

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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed: () {
              vpnLocationController.retrieveVpnInformation();
            },
            child: const Icon(
              CupertinoIcons.refresh_circled,
              size: 40,
            ),
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
