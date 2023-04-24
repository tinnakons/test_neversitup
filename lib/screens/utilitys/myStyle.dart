import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_neversitup/models/appTextSetting.dart';

class MyStyle {
  //style App

  Color colorTheme() {
    Color result; //= Color(0xff212529);

    if (AppTextSetting.THEME_APP == 'black') {
      result = AppTextSetting.THEME_COLOR_BLACK;
    } else {
      result = AppTextSetting.THEME_COLOR_WHITE;
    }

    return result;
  }

  Color colorThemeBG() {
    Color result; //= Color(0xff212529);

    if (AppTextSetting.THEME_APP == 'black') {
      result = AppTextSetting.THEME_COLOR_BG_BLACK;
    } else {
      result = AppTextSetting.THEME_COLOR_BG_WHITE;
    }

    return result;
  }

  Color colorText() {
    Color result; //= Color(0xff212529);

    if (AppTextSetting.THEME_APP == 'black') {
      result = Colors.white;
    } else {
      result = Colors.grey.shade800;
    }

    return result;
  }

  SizedBox mySizebox() => SizedBox(
        width: 8,
        height: 16,
      );

  BoxShadow boxShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 5,
      offset: Offset(0, 0), // changes position of shadow
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [MyStyle().boxShadow()]);
  }

  MyStyle();
}
