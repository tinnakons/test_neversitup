import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_neversitup/controllers/apiController.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/appTextSetting.dart';
import 'package:test_neversitup/screens/utilitys/myStyle.dart';

class AppBarMenu extends APIController {
  TextEditingController searchText = TextEditingController();
  AppBar mainAppBar(BuildContext context, String title, AppState state) {
    return AppBar(
      iconTheme: IconThemeData(color: AppTextSetting.primaryColor),
      title: Row(
        children: [
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //       child: Image.asset(
          //     'assets/icons/facebook.png',
          //     width: 40,
          //     height: 30,
          //     fit: BoxFit.contain,
          //   )),
          // ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.grey.shade300, width: 0.6)),
                    height: 30,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Container(
                            height: 50,
                            //width: MediaQuery.of(context).size.width / 2.1,
                            child: TextFormField(
                              controller: searchText,
                              onFieldSubmitted: (val) {},
                              cursorColor: AppTextSetting.primaryColor,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'ค้นหา',
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: MyStyle().colorTheme(),
      titleSpacing: 0.0,
      actions: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          // width: 40,
          margin: const EdgeInsets.all(0),

          child: InkWell(
            child: Stack(
              children: [
                Container(
                  child: FaIcon(
                    FontAwesomeIcons.search,
                    size: 23,
                    color: Colors.blue[500],
                  ),
                ),
              ],
            ),
            onTap: () async {},
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  AppBar titleAppBar(BuildContext context, String title, Color backgroundColor,
      Color textColor) {
    return AppBar(
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: AppTextSetting.primaryColor),
      title: Text(
        title,
        style: TextStyle(
            color: textColor, //Color(0xFF0070c0),
            fontSize: 15,
            fontFamily: AppTextSetting.APP_FONT,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: backgroundColor,
    );
  }

  AppBarMenu();
}
