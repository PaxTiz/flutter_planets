import 'package:flutter/material.dart';
import '../components/header.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          title: 'Favorites',
          search: true,
          onSearch: (val) => print(val),
        ),
      ],
    );
  }
}