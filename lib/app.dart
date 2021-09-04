import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/screens/favorites_screen.dart';
import 'package:planets/screens/home_screen.dart';
import 'package:planets/screens/profile_screen.dart';
import 'package:planets/stores/planet_store.dart';
import 'package:provider/provider.dart';

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
        icon: CupertinoIcons.person,
        title: 'Profile',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlanetStore(),
      child: Scaffold(
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
                bottom: 32,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 34, 47, 62),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _items.map((k) {
                        final index = _items.indexOf(k);
                        final color = _currentIndex == index
                            ? Color.fromARGB(255, 72, 219, 251)
                            : Color.fromARGB(255, 113, 128, 147);

                        return GestureDetector(
                          onTap: () => setState(() => _currentIndex = index),
                          child: Column(
                            children: [
                              Icon(
                                k.icon,
                                color: color,
                              ),
                              SizedBox(height: 4),
                              Text(k.title, style: TextStyle(color: color)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
