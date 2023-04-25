import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/appTextSetting.dart';
import 'package:test_neversitup/models/baseWidget.dart';
import 'package:test_neversitup/models/contentWidget.dart';
import 'package:test_neversitup/models/screenIndex.dart';
import 'package:test_neversitup/screens/navigations/appBarMenu.dart';
import 'package:test_neversitup/screens/navigations/navigationMenuBar.dart';
import 'package:test_neversitup/screens/utilitys/myStyle.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "Home";
  final void Function()? onInit;
  int? initScreen;
  int? tabIndex;

  HomeScreen({Key? key, @required this.onInit, this.initScreen, this.tabIndex})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.onInit!();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var screenIndex = ScreenIndex(0);
  int screenTabIndex = 0;

  // Future<int> reLoginPin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   DateTime now = new DateTime.now();
  //   int loginTime = prefs.getInt('logintime') ?? 0;

  //   if (now.minute < loginTime) {
  //     return (now.minute + 60) - loginTime;
  //   } else {
  //     return now.minute - loginTime;
  //   }
  // }

  setCurrentTab(int tab) async {
    // var sum = await reLoginPin();
    // print('====> logintime : ' + sum.toString());
    FocusScope.of(context).unfocus();
    setState(() {
      /*PINCode(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(getLoginAction);
              },
              title: 'Enter Your PIN Code',
              type: '1',
            ) */
      //set minute

      screenIndex.intIndex = tab;
      if (tab != 2) {
        screenTabIndex = 0;
      }
    });
    print('====> ScreenIndex : ' + screenIndex.intIndex.toString());
  }

  //bottomMenubar
  BottomNavigationBar bottomBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyStyle().colorTheme(),
        selectedItemColor: Colors.lightBlue,
        selectedLabelStyle: const TextStyle(
            //color: Colors.lightBlue,
            fontFamily: AppTextSetting.APP_FONT,
            fontSize: AppTextSetting.FONT_SIZE_SMALL,
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
            fontFamily: AppTextSetting.APP_FONT,
            fontSize: AppTextSetting.FONT_SIZE_SMALL,
            fontWeight: FontWeight.bold),
        items: [
          NavigationMenuBar().buildBottomNavigationBarItem(
              FontAwesomeIcons.calculator,
              FontAwesomeIcons.calculator,
              0,
              screenIndex,
              AppTextSetting.BTB_TITLE_0),
          NavigationMenuBar().buildBottomNavigationBarItem(
              FontAwesomeIcons.code,
              FontAwesomeIcons.code,
              1,
              screenIndex,
              AppTextSetting.BTB_TITLE_1),
          // NavigationMenuBar().buildBottomNavigationBarItem(
          //     FontAwesomeIcons.solidBell,
          //     FontAwesomeIcons.solidBell,
          //     2,
          //     screenIndex,
          //     AppTextSetting.BTB_TITLE_2),
          // NavigationMenuBar().buildBottomNavigationBarItem(
          //     FontAwesomeIcons.alignJustify,
          //     FontAwesomeIcons.alignJustify,
          //     3,
          //     screenIndex,
          //     AppTextSetting.BTB_TITLE_3),
        ],
        currentIndex: screenIndex.index > 4 ? 0 : screenIndex.index,
        //selectedItemColor: Colors.white,
        unselectedItemColor: MyStyle().colorText(),
        onTap: setCurrentTab,
      );

  DateTime? backbuttonpressedTime;
  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime!) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
          msg: "กด 2 ครั้งเพื่อจบการทำงานของแอปพลิเคชัน",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }

    return exit(0); //Utility().exitApp(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initScreen != null) {
      setState(() {
        screenIndex.index = widget.initScreen!;
        widget.initScreen = null;
      });
    }
    if (widget.tabIndex != null) {
      setState(() {
        screenTabIndex = widget.tabIndex!;
        widget.tabIndex = null;
      });
      print('====> screenTab : ' + screenTabIndex.toString());
    }
    return WillPopScope(
      onWillPop: () => onWillPop(),
      child: BaseWidget(
          screenIndex: screenIndex,
          child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) {
                return Scaffold(
                  appBar: screenIndex.index == 5
                      ? null
                      : AppBarMenu().mainAppBar(context, 'Baimiang', state),
                  body: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          ContentWidget(
                            screenTabIndex: screenTabIndex,
                          ),
                        ],
                      ),
                    ),

                    //this.widgets
                  ),
                  bottomNavigationBar: bottomBar(),
                  // drawer: Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: DrawerMemu().showDrawerMenu(context, state),
                  // ),
                );
              })),
    );
  }
}
