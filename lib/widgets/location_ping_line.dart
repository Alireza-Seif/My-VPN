import 'package:flutter/material.dart';
import 'package:my_vpn/widgets/custom_widget.dart';

class LPLine extends StatelessWidget {
  const LPLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomdWidget(
          titleText: 'Location',
          subTitleText: 'Free',
          roundWidgetWithIcon: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.flag_circle,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        CustomdWidget(
          titleText: '60 ms',
          subTitleText: 'PING',
          roundWidgetWithIcon: CircleAvatar(
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
    );
  }
}
