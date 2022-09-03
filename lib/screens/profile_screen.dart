import 'package:flutter/material.dart';

import '../components/header.dart';
import '../config/config.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(kSpacing(2)),
        child: Column(
          children: [
            Header(title: 'Profile', back: true, profile: false),
          ],
        ),
      ),
    );
  }
}
