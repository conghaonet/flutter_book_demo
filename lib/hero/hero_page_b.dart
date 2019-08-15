import 'package:flutter/material.dart';

class HeroPageB extends StatelessWidget {
  final String name;
  HeroPageB({Key key, this.name}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 10,
            bottom: 10,
            child: Hero(
              tag: name,
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