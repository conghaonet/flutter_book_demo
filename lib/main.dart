import 'package:flutter/material.dart';
import 'book_demo/main_chapter_2.dart' as chapter2;
import 'book_demo/main_chapter_3-1.dart' as chapter3_1;
import 'book_demo/main_chapter_4-5-1.dart' as chapter4_5_1;
import 'book_demo/main_chapter_4-5-3.dart' as chapter4_5_3;
import 'book_demo/main_chapter_4-6.dart' as chapter4_6;
import 'book_demo/main_chapter_5-1.dart' as chapter5_1;
import 'book_demo/main_chapter_7-5.dart' as chapter7_5;
import 'book_demo/main_chapter_8-1.dart' as chapter8_1;
import 'book_demo/main_chapter_8-2.dart' as chapter8_2;
import 'book_demo/main_chapter_10-1.dart' as chapter10_1;
import 'book_demo/main_chapter_10-3.dart' as chapter10_3;
import 'cookbook/network_fetch_data.dart' as cookbook_network_fetch;
import 'cookbook/network_parsing_json_in_background.dart' as cookbook_parsing_json_in_background;

const TITLE = 'Flutter技术入门与实战';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600]
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {

  void _gotoPage(BuildContext context, Widget targetPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLE),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('chapter2 自定义主题'),
            onPressed: () => _gotoPage(context, chapter2.MyHomePage(title: 'chapter2 自定义主题')),
          ),
          RaisedButton(
            child: Text('chapter3-1 文本组件'),
            onPressed: () => _gotoPage(context, chapter3_1.ContainerDemo()),
          ),
          RaisedButton(
            child: Text('chapter4-5-1 列表组件'),
            onPressed: () => _gotoPage(context, chapter4_5_1.MyHomePage()),
          ),
          RaisedButton(
            child: Text('chapter4-5-3 长列表组件'),
            onPressed: () => _gotoPage(context, chapter4_5_3.MyHomePage()),
          ),
          RaisedButton(
            child: Text('chapter4-6 登录表单'),
            onPressed: () => _gotoPage(context, chapter4_6.LoginPage()),
          ),
          RaisedButton(
            child: Text('chapter5-1 路由示例'),
            onPressed: () => _gotoPage(context, chapter5_1.MyApp()),
          ),
          RaisedButton(
            child: Text('chapter7-5 布局综合示例'),
            onPressed: () => _gotoPage(context, chapter7_5.MyApp()),
          ),
          RaisedButton(
            child: Text('chapter8-1 手势检测示例'),
            onPressed: () => _gotoPage(context, chapter8_1.MyApp()),
          ),
          RaisedButton(
            child: Text('chapter8-2 滑动删除示例'),
            onPressed: () => _gotoPage(context, chapter8_2.MyApp()),
          ),
          RaisedButton(
            child: Text('chapter10-1 导航页面示例'),
            onPressed: () => _gotoPage(context, chapter10_1.FirstScreen()),
          ),
          RaisedButton(
            child: Text('chapter10-3 导航页面示例-带参数'),
            onPressed: () => _gotoPage(context, chapter10_3.FirstScreen()),
          ),
          RaisedButton(
            child: Text('cookbook_network_fetch'),
            onPressed: () => _gotoPage(context, cookbook_network_fetch.MyApp()),
          ),
          RaisedButton(
            child: Text('cookbook_parsing_json_in_background'),
            onPressed: () => _gotoPage(context, cookbook_parsing_json_in_background.MyApp()),
          ),
        ],
      ),
    );
  }
}
