import 'package:flutter/material.dart';
import '../components/header.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: 'Profile'),
      ],
    );
  }
}