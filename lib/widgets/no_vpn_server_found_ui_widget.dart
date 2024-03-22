 import 'package:flutter/material.dart';

noVpnServerFoundUIWidget() {
    return const Center(
      child: Text(
        'No VPNs Found, Try Again',
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
      ),
    );
  }
