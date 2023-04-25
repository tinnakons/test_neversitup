import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/appTextSetting.dart';
import 'package:test_neversitup/screens/utilitys/myStyle.dart';

class Prime extends StatefulWidget {
  static const String id = "Prime";
  final void Function()? onInit;
  const Prime({Key? key, required this.onInit}) : super(key: key);

  @override
  State<Prime> createState() => _PrimeState();
}

class _PrimeState extends State<Prime> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    widget.onInit!();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadData() async {
    isLoading = false;
  }

  Container prime(BuildContext context, double heightScreen, double widthScreen,
      AppState state) {
    return Container(
      width: widthScreen,
      child: Column(
        children: [
          Center(child: Text('program generate จำนวนเฉพาะ')),
          Column(
            children: listPrime(context, heightScreen, widthScreen),
          )
        ],
      ),
    );
  }

  List<Widget> listPrime(
      BuildContext context, double heightScreen, double widthScreen) {
    int prime = 0;
    List<Widget> card = [];

    for (int number = 0; number <= 1000; number++) {
      if (number == 0 || number == 1) prime = 1;

      if (prime == 0) {
        for (int i = 2; i <= (number / 2); i++) {
          if (number % i == 0) {
            prime = 1;
            break;
          }
        }
      }

      if (prime == 0) {
        card.add(Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 5,
              right: 5,
              bottom: 5,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [MyStyle().boxShadow()]),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '$number เป็นจำนวนเฉพาะ',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                )
              ],
            )));
      } else {
        card.add(Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 5,
              right: 5,
              bottom: 5,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [MyStyle().boxShadow()]),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '$number ไม่เป็นจำนวนเฉพาะ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                )
              ],
            )));
      }

      prime = 0;
    }

    return card;
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return isLoading
              ? Container(
                  height: heightScreen,
                  width: widthScreen,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : prime(context, heightScreen, widthScreen, state);
        });
  }
}
