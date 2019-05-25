import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '导航页面示例',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航页面示例'),),
      body: Center(
        child: RaisedButton(
          child: Text('查看商品详情页'),
          onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen(param: '我是跳转时带的参数',))
              );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final param;

  SecondScreen({Key key, @required this.param}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航页面示例'),),
      body: Center(
        child: RaisedButton(
          child: Text('返回页面  ${this.param}'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}