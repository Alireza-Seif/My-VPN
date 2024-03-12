import 'package:flutter/material.dart';
import 'package:my_vpn/widgets/custom_widget.dart';

class DULine extends StatelessWidget {
  const DULine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomdWidget(
          titleText: '0 kbps',
          subTitleText: 'DOWNLOAD',
          roundWidgetWithIcon: CircleAvatar(
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
          titleText: '0 kbps',
          subTitleText: 'UPLOAD',
          roundWidgetWithIcon:  CircleAvatar(
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
}
