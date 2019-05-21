import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Vector {
  final int x;
  final int y;
  const Vector(this.x, this.y);

  Vector operator + (Vector v) {
    return new Vector(x + v.x, y + v.y);
  }
  Vector operator - (Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}
/*
main() {
  final v = new Vector(2, 3);
  final w = new Vector(2, 2);
  final r1 = v + w;
  print('r1.x = ' + r1.x.toString()  + 'r1.y = ' + r1.y.toString());
}
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final v = new Vector(2, 3);
    final w = new Vector(2, 2);
    final r1 = v + w;
    print('r1.x = ' + r1.x.toString()  + 'r1.y = ' + r1.y.toString());
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600]
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}