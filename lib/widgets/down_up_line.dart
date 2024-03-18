import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:my_vpn/all_controllers/controller_home.dart';
import 'package:my_vpn/models/vpn_status.dart';
import 'package:my_vpn/vpn_engine/vpn_engine.dart';
import 'package:my_vpn/widgets/custom_widget.dart';

class DULine extends StatelessWidget {
   DULine({
    super.key,
  });

  final homeController = Get.put(ControllerHome());

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<VpnStatus?>(
      initialData: VpnStatus(),
      stream: VpnEngine.snapshotVpnStatus(),
      builder: (context, dataSnapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomdWidget(
              titleText: dataSnapshot.data?.byteIn ?? '0 kbps',
              subTitleText: 'DOWNLOAD',
              roundWidgetWithIcon: const CircleAvatar(
                radius: 32,
                backgroundColor: Colors.greenAccent,
                child: Icon(
                  Icons.arrow_circle_down,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            CustomdWidget(
              titleText: dataSnapshot.data?.byteOut ?? '0 kbps',
              subTitleText: 'UPLOAD',
              roundWidgetWithIcon:  const CircleAvatar(
                radius: 32,
                backgroundColor: Colors.pinkAccent,
                child: Icon(
                  Icons.arrow_circle_up_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
