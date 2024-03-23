import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_vpn/api/api_vpn_get.dart';
import 'package:my_vpn/models/ip_info.dart';
import 'package:my_vpn/models/network_ip_info.dart';
import 'package:my_vpn/widgets/network_ip_info_widget.dart';

class CpnnectedNetworkIPInfoScreen extends StatelessWidget {
  const CpnnectedNetworkIPInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ipInfo = IPInfo.fromJson({}).obs;
    ApiVpnGate.retrieveIPDetails(ipInformation: ipInfo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Connected Network IP Information',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 10,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            ApiVpnGate.retrieveIPDetails(ipInformation: ipInfo);
          },
          child: const Icon(CupertinoIcons.refresh_circled),
        ),
      ),
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(3),
          children: [
            //ip address
            NetworkIPInfoWidget(
              networkIPInfo: NetworkIPInfo(
                  titleText: 'IP Address',
                  subtitleText: ipInfo.value.query,
                  iconData: const Icon(
                    Icons.my_location_outlined,
                    color: Colors.redAccent,
                  )),
            ),

            //location
            NetworkIPInfoWidget(
              networkIPInfo: NetworkIPInfo(
                  titleText: 'Location',
                  subtitleText: ipInfo.value.countryName.isEmpty
                      ? 'Retrieving...'
                      : '${ipInfo.value.cityName}, ${ipInfo.value.regionName}, ${ipInfo.value.countryName}',
                  iconData: const Icon(
                    CupertinoIcons.location_solid,
                    color: Colors.green,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
