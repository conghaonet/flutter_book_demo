import 'package:flutter/material.dart';

void main() => runApp(MyApp(
  //使用generate方法产生500条数据
  items: List<String>.generate(300, (i) => "Item $i"),
));

class MyApp extends StatelessWidget {
  final List<String> items;
  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = "长列表组件";
    return MaterialApp(
      title: 'LongListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
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
      ),
    );
  }
}