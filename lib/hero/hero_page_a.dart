import 'package:flutter/material.dart';

import 'hero_page_b.dart';

void main() => runApp(HeroDemoApp());

class HeroDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Demo',
      home: HeroPageA(),
      routes: {
//        '/page_b': (_) => HeroPageB(),
      },
      onGenerateRoute: (settings) {
        MaterialPageRoute targetPage;
        if(settings.name == '/page_b') {
          String name = settings.arguments;
          targetPage = MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return HeroPageB(name: name);
            },
          );
          return targetPage;
        }
        return targetPage ?? MaterialPageRoute(builder: (context) {return HeroPageB(name: 'avatar');});
      },
    );
  }

}

class HeroPageA extends StatefulWidget {
  @override
  _HeroPageAState createState() => _HeroPageAState();
}

class _HeroPageAState extends State<HeroPageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero page A"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/page_b', arguments: 'avatar');
              },
              child: Hero(
                tag: 'avatar',
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/wudang.jpg'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}