import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本组件'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('红色+黑色删除线+25号字',
            style: TextStyle(
              color: const Color(0xffff0000),
              decoration: TextDecoration.lineThrough,
              decorationColor: const Color(0xff000000),
              fontSize: 25.0,
            ),
          ),
          Text('橙色+下划线+24号字',
            style: TextStyle(
              color: const Color(0xffff9900),
              decoration: TextDecoration.underline,
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Text demo',
      home: ContainerDemo(),
    )
  );
}

