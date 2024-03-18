import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_vpn/all_controllers/controller_home.dart';
import 'package:my_vpn/widgets/custom_widget.dart';

class LPLine extends StatelessWidget {
  LPLine({
    super.key,
  });

  final homeController = Get.put(ControllerHome());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomdWidget(
            titleText: homeController.vpnInfo.value.countryLongName.isEmpty
                ? 'Location'
                : homeController.vpnInfo.value.countryLongName,
            subTitleText: 'Free',
            roundWidgetWithIcon: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.redAccent,
              backgroundImage: homeController
                      .vpnInfo.value.countryLongName.isEmpty
                  ? null
                  : AssetImage(
                      'assets/images/countryFlags/${homeController.vpnInfo.value.countryShortName.toLowerCase()}.png'),
              child: homeController.vpnInfo.value.countryLongName.isEmpty
                  ? const Icon(
                      Icons.flag_circle,
                      size: 30,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          CustomdWidget(
            titleText: homeController.vpnInfo.value.countryLongName.isEmpty
                ? '60 ms'
                : '${homeController.vpnInfo.value.ping} ms',
            subTitleText: 'PING',
            roundWidgetWithIcon: const CircleAvatar(
              radius: 32,
              backgroundColor: Colors.black54,
              child: Icon(
                Icons.graphic_eq,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
