import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title= '布局综合示例';
    //风景地址部分
    Widget address = Container(
      padding: const EdgeInsets.all(23),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('风景地址', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Text('湖北省十堰市丹江口市', style: TextStyle(color: Colors.grey),),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.yellow),
          Text('99'),
        ],
      ),
    );
    //构建按钮组中单个按钮，参数为图标及文本
    Column buildButtonColumn(IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min, //垂直方向，高度最小化
        mainAxisAlignment: MainAxisAlignment.center, //垂直方向，居中对齐
        children: <Widget>[
          Icon(icon, color: Colors.lightGreen[600],),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen[600]
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      title: title,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[600],
        accentColor: Colors.orange[600],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/wudang.jpg', fit: BoxFit.cover,),
            address,
          ],
        ),
      ),
    );
  }

}