import 'dart:async';

import 'package:flutter/material.dart';

import 'bloc_provider.dart';
import 'counter_bloc.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Default Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: BlocProvider(
        child: MyHomePage(title: 'Flutter Demo Home Page'),
        blocs: [CounterBloc(), CounterBloc()],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counterB = 0;

  void _incrementCounter() {
    BlocProvider.of<CounterBloc>(context).first.increment(_counter);
  }
  @override
  void initState() {
    BlocProvider.of<CounterBloc>(context).first.counterStream.listen((_value) {
      setState(() {
        _counter = _value;
      });
    });
    BlocProvider.of<CounterBloc>(context).first.counterStream.listen((_value) {
      setState(() {
        _counterB = _value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            MaterialButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).first.dispose();
              },
              color: Colors.grey,
              child: Text('dispose'),
            ),
            Text(
              '$_counterB',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
