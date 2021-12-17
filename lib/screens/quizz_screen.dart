import 'package:flutter/material.dart';
import '../components/header.dart';

class QuizzScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: 'Quizz'),
      ],
    );
  }
}