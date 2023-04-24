import 'package:flutter/material.dart';
import 'package:test_neversitup/models/screenIndex.dart';



class BaseWidget extends InheritedWidget {
  final ScreenIndex? screenIndex;

  final Widget child;

  const BaseWidget({super.key,  @required this.screenIndex,  required this.child}) : super(child: child);

  static BaseWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BaseWidget>();

  @override
  bool updateShouldNotify(BaseWidget oldWidget) {

    return screenIndex != oldWidget.screenIndex;
  }
}
