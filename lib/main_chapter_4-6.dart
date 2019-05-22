import 'package:flutter/material.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String userName, password;

  void login() {
    var loginForm = loginKey.currentState;
    //验证表单
    if(loginForm.validate()) {
      loginForm.save();
      print("userName: $userName  password: $password");
    }
  }

  @override
  Widget build(BuildContext context) {
    final String title = '登录表单';
    return MaterialApp(
      title: title,
      home: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: loginKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入用户名',
                        ),
                        onSaved: (value) {
                          userName = value;
                        },
                        onFieldSubmitted: (value) {

                        },
                        //验证表单方法
                        validator: (value) {
                          return value.trim().isEmpty ? '用户名不可为空' : null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入密码'
                        ),
                        onSaved: (value) {
                          password = value;
                        },
                        obscureText: true,
                        //验证表单方法
                        validator: (value) {
                          return value.length < 6 ? '密码长度不够6位' : null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 340.0,
                height: 42.0,
                child: RaisedButton(
                  onPressed: login,
                  child: Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}