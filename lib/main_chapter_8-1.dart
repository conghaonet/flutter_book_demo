import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //一定要把被触摸的组件方在GestureDetector里面
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text('您已按下'),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      onLongPress: () {
        final snackBar = SnackBar(content: Text('您长按'),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      //添加容器接收触摸动作
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text('测试按钮'),
      ),
    );
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '手势检测示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('手势检测'),
        ),
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
  
}