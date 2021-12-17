import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/custom_nav_bar.dart';
import './screens/favorites_screen.dart';
import './screens/home_screen.dart';
import './screens/profile_screen.dart';
import './screens/quizz_screen.dart';

class BarItem {
  final IconData icon;
  final String title;

  BarItem({required this.icon, required this.title});
}

class App extends StatefulWidget {
  final int startIndex;

  App({this.startIndex = 0});

  createState() => _AppState();
}

class _AppState extends State<App> {
  late int _currentIndex;
  final _tabs = [
    HomeScreen(),
    FavoritesScreen(),
    QuizzScreen(),
    ProfileScreen(),
  ];
  late List<BarItem> _items;

  @override
  initState() {
    super.initState();
    _currentIndex = widget.startIndex;
    _items = [
      BarItem(
        icon: CupertinoIcons.compass,
        title: 'Explore',
      ),
      BarItem(
        icon: CupertinoIcons.heart,
        title: 'Favorite',
      ),
      BarItem(
        icon: CupertinoIcons.question_circle, 
        title: 'Quizz'
      ),
      BarItem(
        icon: CupertinoIcons.person,
        title: 'Profile',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 112),
              child: _tabs[_currentIndex],
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: CustomNavBar(
                items: _items,
                currentIndex: _currentIndex,
                onClick: (i) => setState(() => _currentIndex = i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
