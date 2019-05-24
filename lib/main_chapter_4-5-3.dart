import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "长列表组件";
    return MaterialApp(
      title: title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用generate方法产生500条数据
    var items = List<String>.generate(300, (i) => "Item $i");

    return Scaffold(
      appBar: AppBar(
        title: Text('长列表组件'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if(index % 2 == 0) {
            return ListTile(
              title: Text("${items[index]}"),
              leading: Icon(Icons.phone),
            );
          } else {
            return ListTile(
              title: Text("${items[index]}"),
              leading: Icon(Icons.phone),
              subtitle: Text("sub ${items[index]}"),
            );
          }
        },
      ),
    );
  }

}