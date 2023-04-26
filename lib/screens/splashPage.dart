
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/getAction.dart';
import 'package:test_neversitup/screens/homeScreen.dart';
import 'package:test_neversitup/screens/utilitys/myStyle.dart';


class SplashPage extends StatefulWidget {
  static const String id = "SplashPage";
  final void Function()? onInit;
  const SplashPage({Key? key, @required this.onInit}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    //widget.onInit!();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadData() async {
   
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return SplashScreen(
              seconds: 3,
              navigateAfterSeconds:HomeScreen(
                onInit: () {
                  StoreProvider.of<AppState>(context).dispatch(getLoginAction);
                },
                initScreen: 0,
                tabIndex: 0,
              ),
              // title: const Text(
              //   'Facebook',
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 20,
              //       fontFamily: AppTextSetting.APP_FONT),
              // ),
              image: Image.asset('assets/icons/logo.png'),
              backgroundColor: MyStyle().colorTheme(),
              styleTextUnderTheLoader: const TextStyle(),
              photoSize: 50.0,
              loaderColor: Colors.blue);
        });
  }
}
