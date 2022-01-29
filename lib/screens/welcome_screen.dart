import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/constants.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_background.jpeg'),
            fit: BoxFit.cover,
          )
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hello !', 
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Want to know and explore all things about the planets in the Milky Way galaxy ?', 
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1.5),
                  ),
                  SizedBox(height: 24),
                  CupertinoButton(
                    onPressed: () => Navigator.of(context).pushReplacementNamed('/'), 
                    child: Text('Explore Now'),
                    color: CustomColors.button_color,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}