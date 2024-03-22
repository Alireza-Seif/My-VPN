import 'package:get/get.dart';
import 'package:my_vpn/api/api_vpn_get.dart';
import 'package:my_vpn/app_preferences/app_preferences.dart';
import 'package:my_vpn/models/vpn_info.dart';

class ControllerVPNLocation extends GetxController {
  List<VpnInfo> vpnFreeServersAvailableList = AppPreferences.vpnList;
  final RxBool isLoadingNewLocations = false.obs;

  Future<void> retrieveVpnInformation() async {
    isLoadingNewLocations.value = true;
    vpnFreeServersAvailableList.clear();
    vpnFreeServersAvailableList =
        await ApiVpnGate.retrieveAllAvailableVpnFreeServers();

    isLoadingNewLocations.value = false;
  }
}
