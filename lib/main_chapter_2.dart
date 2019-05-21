import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';
    return MaterialApp(
      title: appName,
      //自定义主题
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.cyan[600]
      ),
      home: MyHomePage(
          key: Key('MyHomePageKey'),
          title: appName
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, @required this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      const url = 'http://www.baidu.com';
      //url_launcher请求
      launch(url);
      //http请求
      http.get(url).then((response) {
        print("正文：${response.body}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          //获取主题的accentColor
          color: Theme.of(context).accentColor,
          child: Text(
              "带有背景颜色的文本组件 $_counter",
              style: Theme.of(context).textTheme.title
          ),
        ),
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.grey),
          child: FloatingActionButton(
            onPressed: _incrementCounter,
            child: Icon(Icons.add),
          )
      ),
    );
  }

}
