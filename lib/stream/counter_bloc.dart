import 'dart:async';

import 'bloc_base.dart';
class CounterBloc extends BlocBase {
  final _controller = StreamController<int>.broadcast(sync: true,
      onListen: onListen,
      onCancel: onCancel
  );
  StreamSink<int> get _counterSink => _controller.sink;
  Stream<int> get counterStream => _controller.stream;

  void increment(int count) {
    _counterSink.add(++count);
    //或者：_controller.add(++count);
  }

  static void onListen() {
    print("CounterBloc ====> CounterBloc is onListen.");
  }
  static void onCancel() {
    print("CounterBloc ====> CounterBloc is onCancel.");
  }

  @override
  void dispose() {
    _controller.close();
  }

}
