import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  Widget horizontalList() {
    return Container(
      height: 222.0,
      color: Colors.grey[300],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[200],
            width: 120.0,
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                child: new Container(
                  width: 10.0,
                  height: 20.0 * (index + 1),
                  color: Colors.red,
                ),
              ),
/*
              child: Text(
                '$index',
                style: Theme.of(context).textTheme.title,
              ),
*/
            ),
          );
        },
        itemCount: 6,
        shrinkWrap: true, // todo comment this out and check the result
        physics:
        ClampingScrollPhysics(), // todo comment this out and check the result
      ),
    );
  }

  Widget verticalList() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8.0),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          color: Colors.grey[200],
          width: 120.0,
          height: 120.0,
          child: Center(
            child: Text(
              '$index',
              style: Theme.of(context).textTheme.title,
            ),
          ),
        );
      },
      itemCount: 9,
      shrinkWrap: true, // todo comment this out and check the result
      physics:
      ClampingScrollPhysics(), // todo comment this out and check the result
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              horizontalList(),
              verticalList(),
            ]),
          ),
        ],
      ),
    );
  }
}