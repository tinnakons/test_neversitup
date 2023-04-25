import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/getAction.dart';
import 'package:test_neversitup/models/screenIndex.dart';
import 'package:test_neversitup/screens/dashboard.dart';
import 'package:test_neversitup/screens/prime.dart';
import 'package:test_neversitup/screens/myTest.dart';

import 'baseWidget.dart';

class ContentWidget extends StatefulWidget {
  final int? screenTabIndex;
  const ContentWidget({Key? key, @required this.screenTabIndex})
      : super(key: key);
  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    ScreenIndex screenIndex = BaseWidget.of(context)!.screenIndex!;

    switch (screenIndex.intIndex) {
      case 0:
        {
          return Dashboard(
            onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            },
          );
        }
        break;
      case 1:
        {
          return Prime(
            onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            },
          );
        }
        break;
      case 2:
        {
          return MyTest(
            onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            },
          );
        }
        break;

      default:
        {
          return Center(child: Text('อยู่ระหว่างพัฒนาระบบ'));
        }
        break;
    }
  }
}
