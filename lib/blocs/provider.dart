import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({Key key, Widget child})
    : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    // Find the widget Provider in the chain of contexts
    // and do a type coercion to a instance of Provider
    // this instance will have a bloc propertie
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}