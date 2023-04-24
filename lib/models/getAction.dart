

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_neversitup/models/appState.dart';

class GetAction {
  final dynamic _token;
  final dynamic _cusID;
  final dynamic _cusUsername;
  final dynamic _cusPassword;
  final dynamic _cusFirstname;
  final dynamic _cusLastname;
  final dynamic _cusPhone;
  final dynamic _cusGender;
  final dynamic _cusBirthday;
  final dynamic _cusImageProfile;
  final dynamic _cusRegisterType;
  final dynamic _cusPriceLevel;
  final dynamic _cusEmail;
  final dynamic _countCart;
  final dynamic _empID;
  final dynamic _cusCode;

  dynamic get token => this._token;
  dynamic get cusID => this._cusID;
  dynamic get cusUsername => this._cusUsername;
  dynamic get cusPassword => this._cusPassword;
  dynamic get cusFirstname => this._cusFirstname;
  dynamic get cusLastname => this._cusLastname;
  dynamic get cusPhone => this._cusPhone;
  dynamic get cusGender => this._cusGender;
  dynamic get cusBirthday => this._cusBirthday;
  dynamic get cusImageProfile => this._cusImageProfile;
  dynamic get cusRegisterType => this._cusRegisterType;
  dynamic get cusPriceLevel => this._cusPriceLevel;
  dynamic get cusEmail => this._cusEmail;
  dynamic get countCart => this._countCart;
  dynamic get empID => this._empID;
  dynamic get cusCode => this._cusCode;

  GetAction(
      this._token,
      this._cusID,
      this._cusUsername,
      this._cusPassword,
      this._cusFirstname,
      this._cusLastname,
      this._cusPhone,
      this._cusGender,
      this._cusBirthday,
      this._cusImageProfile,
      this._cusRegisterType,
      this._cusPriceLevel,
      this._cusEmail,
      this._countCart,
      this._empID,
      this._cusCode);
}

ThunkAction<AppState> getLoginAction = (Store<AppState> store) async {
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  final String? cusID = prefs.getString('cusID');
  final String? cusUsername = prefs.getString('cusUsername');
  final String? cusPassword = prefs.getString('cusPassword');
  final String? cusFirstname = prefs.getString('cusFirstname');
  final String? cusLastname = prefs.getString('cusLastname');
  final String? cusPhone = prefs.getString('cusPhone');
  final String? cusGender = prefs.getString('cusGender');
  final String? cusBirthday = prefs.getString('cusBirthday');
  final String? cusImageProfile = prefs.getString('cusImageProfile');
  final String? cusRegisterType = prefs.getString('cusRegisterType');
  final String? cusPriceLevel = prefs.getString('cusPriceLevel');
  final String? cusEmail = prefs.getString('cusEmail');
  final int? countCart = prefs.getInt('countCart');
  final String? empID = prefs.getString('empID');
  final String? cusCode = prefs.getString('cusCode');

  store.dispatch(GetAction(
      token,
      cusID,
      cusUsername,
      cusPassword,
      cusFirstname,
      cusLastname,
      cusPhone,
      cusGender,
      cusBirthday,
      cusImageProfile,
      cusRegisterType,
      cusPriceLevel,
      cusEmail,
      countCart,
      empID,
      cusCode));
};
