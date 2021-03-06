import 'package:flutter/material.dart';
import 'dart:async';
import 'bloc_base.dart';

Type _typeOf<T>() => T;

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final Widget child;
  final List<T> blocs;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.blocs,
  }) : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static List<T> of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BlocProviderInherited<T>>();
//    _BlocProviderInherited<T> provider = context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    _BlocProviderInherited<T> provider = context.ancestorWidgetOfExactType(type);
    return provider?.blocs;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.blocs.map((bloc) {
      bloc.dispose();
    });
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      blocs: widget.blocs,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  final List<T> blocs;
  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.blocs,
  }): super(key: key, child: child);

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;

}
