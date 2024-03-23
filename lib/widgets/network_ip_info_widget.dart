import 'package:flutter/material.dart';
import 'package:my_vpn/main.dart';
import 'package:my_vpn/models/network_ip_info.dart';

class NetworkIPInfoWidget extends StatelessWidget {
  const NetworkIPInfoWidget({super.key, required this.networkIPInfo});

  final NetworkIPInfo networkIPInfo;

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: sizeScreen.height * .01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: Icon(
          networkIPInfo.iconData.icon,
          size: networkIPInfo.iconData.size ?? 28,
        ),
        title: Text(
          networkIPInfo.titleText,
        ),
        subtitle: Text(networkIPInfo.subtitleText),
      ),
    );
  }
}
