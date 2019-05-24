import 'package:flutter/material.dart';

const TITLE = '滑动删除示例';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var items = List<String>.generate(50, (i) => "数据项 $i");

  void showSnackBar(BuildContext context, String name) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(name)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      home: Scaffold(
        appBar: AppBar(title: Text(TITLE),),
        body: ListView.builder(
          //列表长度
          itemCount: items.length,
          //构建列表
          itemBuilder: (context, index) {
            final item = items[index];
            //返回一个可被删除的列表项
            return Dismissible(
              background: Container(
                color: Colors.red,
                child: ListTile(title: Text("删除......", style: TextStyle(fontFamily: 'myfont'),),),
              ),
              key: Key(item),
              //被删除回调
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                showSnackBar(context, "$item 被删除了");
              },
              //用自定义字体myfont
              child: ListTile(title: Text("$item", style: TextStyle(fontFamily: 'myfont'),),),
            );
          },
        ),
      ),
    );
  }
}