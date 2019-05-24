import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "列表组件";
    return MaterialApp(
      title: title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表组件'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text(Icons.alarm.toString()),
            onTap: () {

            },
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
    );
  }

}