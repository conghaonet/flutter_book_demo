import 'package:flutter/material.dart';

class HeroPageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 10,
            bottom: 10,
            child: Hero(
              tag: 'avatar',
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.network('https://flutter.dev/images/homepage/screenshot-2.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}