import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/getAction.dart';
import 'package:test_neversitup/screens/dashboard.dart';
import 'package:test_neversitup/screens/homeScreen.dart';
import 'package:test_neversitup/screens/prime.dart';
import 'package:test_neversitup/screens/splashPage.dart';

import 'models/reducer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(), middleware: [thunkMiddleware]);

  runApp(MaterialApp(home: MyApp(store: store)));
}

class MyApp extends StatelessWidget {
  final Store<AppState>? store;
  MyApp({Key? key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    //StoreProvider.of<AppState>(context).dispatch(getEmpAction);

    return StoreProvider(
        store: store!,
        child: MaterialApp(
            title: 'Facebook',
            routes: {
              HomeScreen.id: (context) {
                return HomeScreen(
                  onInit: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(getLoginAction);
                  },
                  initScreen: 0,
                  tabIndex: 0,
                );
              },
              SplashPage.id: (context) {
                return SplashPage(onInit: () {
                  StoreProvider.of<AppState>(context).dispatch(getLoginAction);
                });
              },
              Dashboard.id: (context) {
                return Dashboard(onInit: () {
                  StoreProvider.of<AppState>(context).dispatch(getLoginAction);
                });
              },
              Prime.id: (context) {
                return Prime(onInit: () {
                  StoreProvider.of<AppState>(context).dispatch(getLoginAction);
                });
              },

              
            },
            home: SplashPage(onInit: () {
              StoreProvider.of<AppState>(context).dispatch(getLoginAction);
            })));
  }
}
