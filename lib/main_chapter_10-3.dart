import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '导航页面示例-带参数返回',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  //异步方法中调用Scaffold.of(context)时，需要通过_scaffoldkey调用，否则会报错
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('导航页面示例-带参数返回'),),
      body: Center(
        child: RaisedButton(
          child: Text('查看商品详情页'),
          onPressed: () {
            _navigateToSecondPage(context);
          },
        ),
      ),
    );
  }
  _navigateToSecondPage(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen(param: '我是跳转时带的参数',))
    );
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(result)));
  }

}

class SecondScreen extends StatelessWidget {
  var param = "";
  SecondScreen({Key key, @required this.param}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航页面示例-带参数返回'),),
      body: Center(
        child: RaisedButton(
          child: Text('返回页面  ${this.param}'),
          onPressed: () {
            Navigator.pop(context, '我是返回参数');
          },
        ),
      ),
    );
  }
}