import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = '路由示例';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(title: title),
      //添加路由
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      },
      //初始路由页面为/first
      initialRoute: '/first',
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState(title: this.title);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;
  _MyHomePageState({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Center(
        child: Text('主页', style: TextStyle(fontSize: 28.0),),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FirstPage'),),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //跳转到第二页
            Navigator.pushNamed(context, '/second');
          },
          child: Text('这是第一页'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondPage'),),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //跳转到第一页
            Navigator.pushNamed(context, '/first');
          },
          child: Text('这是第二页'),
        ),
      ),
    );
  }
}
