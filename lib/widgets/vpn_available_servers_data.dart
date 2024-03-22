  import 'package:flutter/material.dart';
import 'package:my_vpn/all_controllers/controller_vpn_location.dart';
import 'package:my_vpn/widgets/vpn_location_card_widget.dart';

final vpnLocationController = ControllerVPNLocation();

vpnAvailableServersData() {
    return ListView.builder(
      itemCount: vpnLocationController.vpnFreeServersAvailableList.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(3),
      itemBuilder: (context, index) {
        return VpnLocationCard(
            vpnInfo: vpnLocationController.vpnFreeServersAvailableList[index]);
      },
    );
  }
