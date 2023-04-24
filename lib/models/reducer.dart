



import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/getAction.dart';

AppState appReducer(state, action) {
  return AppState(
    //login
    token: loginReducerToken(state.token, action),
    cusID: loginReducerCusID(state.cusID, action),
    cusUsername: loginReducerCusUsername(state.cusUsername, action),
    cusPassword: loginReducerCusPassword(state.cusPassword, action),
    cusFirstname: loginReducerCusFirstname(state.cusFirstname, action),
    cusLastname: loginReducerCusLastname(state.cusLastname, action),
    cusPhone: loginReducerCusPhone(state.cusPhone, action),
    cusGender: loginReducerCusGender(state.cusGender, action),
    cusBirthday: loginReducerCusBirthday(state.cusBirthday, action),
    cusImageProfile: loginReducerCusImageProfile(state.cusImageProfile, action),
    cusRegisterType: loginReducerCusRegisterType(state.cusRegisterType, action),
    cusPriceLevel: loginReducerCusPriceLevel(state.cusPriceLevel, action),
    cusEmail: loginReducerCusEmail(state.cusEmail, action),
    countCart: appReducercountCart(state.countCart, action),
    empID: loginReducerEmpID(state.empID, action),
    cusCode: loginReducerCusCode(state.cusCode,action)
  );
}

//Login
loginReducerToken(token, action) {
  if (action is GetAction) {
    return action.token;
  }
}

loginReducerCusID(cusID, action) {
  if (action is GetAction) {
    return action.cusID;
  }
}

loginReducerCusUsername(cusUsername, action) {
  if (action is GetAction) {
    return action.cusUsername;
  }
}

loginReducerCusPassword(cusPassword, action) {
  if (action is GetAction) {
    return action.cusPassword;
  }
}

loginReducerCusFirstname(cusFirstname, action) {
  if (action is GetAction) {
    return action.cusFirstname;
  }
}

loginReducerCusLastname(cusLastname, action) {
  if (action is GetAction) {
    return action.cusLastname;
  }
}

loginReducerCusPhone(cusPhone, action) {
  if (action is GetAction) {
    return action.cusPhone;
  }
}

loginReducerCusGender(cusGender, action) {
  if (action is GetAction) {
    return action.cusGender;
  }
}

loginReducerCusBirthday(cusBirthday, action) {
  if (action is GetAction) {
    return action.cusBirthday;
  }
}

loginReducerCusImageProfile(cusImageProfile, action) {
  if (action is GetAction) {
    return action.cusImageProfile;
  }
}

loginReducerCusRegisterType(cusRegisterType, action) {
  if (action is GetAction) {
    return action.cusRegisterType;
  }
}

loginReducerCusPriceLevel(cusPriceLevel, action) {
  if (action is GetAction) {
    return action.cusPriceLevel;
  }
}

loginReducerCusEmail(cusEmail, action) {
  if (action is GetAction) {
    return action.cusEmail;
  }
}

loginReducerEmpID(empID, action) {
  if (action is GetAction) {
    return action.empID;
  }
}

loginReducerCusCode(cusCode, action) {
  if (action is GetAction) {
    return action.cusCode;
  }
}



appReducercountCart(countCart, action) {
  if (action is GetAction) {
    return action.countCart;
  }
}
