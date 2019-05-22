import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "列表组件";
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text(Icons.alarm.toString()),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(Icons.phone.toString()),
            ),
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text(Icons.timeline.toString()),
            ),
          ],
        ),
      ),
    );
  }
}