import 'package:flutter/material.dart';

// App State: View initialize the app state file
class AppState {
  final dynamic token;
  final dynamic cusID;
  final dynamic cusUsername;
  final dynamic cusPassword;
  final dynamic cusFirstname;
  final dynamic cusLastname;
  final dynamic cusPhone;
  final dynamic cusGender;
  final dynamic cusBirthday;
  final dynamic cusImageProfile;
  final dynamic cusRegisterType;
  final dynamic cusPriceLevel;
  final dynamic cusEmail;
  final dynamic countCart;
  final dynamic empID;
  final dynamic cusCode;
  AppState(
      {@required this.token,
      this.cusID,
      this.cusUsername,
      this.cusPassword,
      this.cusFirstname,
      this.cusLastname,
      this.cusPhone,
      this.cusGender,
      this.cusBirthday,
      this.cusImageProfile,
      this.cusRegisterType,
      this.cusPriceLevel,
      this.cusEmail,
      this.countCart,
      this.empID,
      this.cusCode});

  factory AppState.initial() {
    return AppState(
        token: null,
        cusID: null,
        cusUsername: null,
        cusPassword: null,
        cusFirstname: null,
        cusLastname: null,
        cusPhone: null,
        cusGender: null,
        cusBirthday: null,
        cusImageProfile: null,
        cusRegisterType: null,
        cusPriceLevel: null,
        cusEmail: null,
        countCart: null,
        empID: null,
        cusCode: null);
  }
}
