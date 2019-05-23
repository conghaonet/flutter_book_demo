import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const TITLE = '滑动删除示例';

class MyApp extends StatelessWidget {
  
  var items = List<String>.generate(30, (i) => "数据项 $i");
  
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
            //书中没有写这段代码
            //用于判断index是否超出items长度
            if(index >= items.length) {
              return null;
            }
            final item = items[index];
            //返回一个可被删除的列表项
            return Dismissible(
              key: Key(item),
              //被删除回调
              onDismissed: (direction) {
                items.removeAt(index);
                showSnackBar(context, "$item 被删除了");
              },
              child: ListTile(title: Text("$item", style: TextStyle(fontFamily: 'myfont'),),),
            );
          },
        ),
      ),
    );
  }
}