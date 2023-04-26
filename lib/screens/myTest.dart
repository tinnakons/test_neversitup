import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/appTextSetting.dart';
import 'package:test_neversitup/screens/utilitys/myStyle.dart';

class MyTest extends StatefulWidget {
  static const String id = "MyTest";
  final void Function()? onInit;
  const MyTest({Key? key, required this.onInit}) : super(key: key);

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  bool isLoading = true;
  TextEditingController txt_number1 = TextEditingController();
  TextEditingController txt_number2 = TextEditingController();
  TextEditingController txt_number3 = TextEditingController();
  TextEditingController txt_number4 = TextEditingController();

  bool chk_txt1 = false;
  bool chk_txt2 = false;
  bool chk_txt3 = false;
  bool chk_txt4 = false;

  @override
  void initState() {
    super.initState();
    loadData();
    widget.onInit!();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadData() async {
    isLoading = false;
  }

  Container test(BuildContext context, double heightScreen, double widthScreen,
      AppState state) {
    return Container(
        width: widthScreen,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(child: Text('TEST')),
              SizedBox(
                height: 10,
              ),
              Text('ข้อ1. input จะต้องมีความยาวมากกว่าหรือเท่ากับ 6 ตัวอักษร'),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 0.5, color: chk_txt1 ? Colors.green : Colors.red),
                ),
                height: 45,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 5,
                  ),
                  child: TextFormField(
                    controller: txt_number1,
                    onChanged: (val) {
                      print(val);
                      val.length >= 6 ? chk_txt1 = true : chk_txt1 = false;
                      widget.onInit!();
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: AppTextSetting.primaryColor,
                    style: const TextStyle(
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 13.0,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'ป้อนตัวเลข',
                        hintStyle: TextStyle(
                            fontSize: 10,
                            color:
                                chk_txt1 == true ? Colors.green : Colors.red)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('ข้อ2. input จะต้องกันไม่ให้มีเลขซ้ำติดกันเกิน 2 ตัว'),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 0.5, color: chk_txt2 ? Colors.green : Colors.red),
                ),
                height: 45,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 5,
                  ),
                  child: TextFormField(
                    controller: txt_number2,
                    onChanged: (val) {
                      int count = 0;

                      if (val.length >= 6) {
                        for (int i = 0; i < val.length; i++) {
                          for (int j = i + 1; j <= i + 1; j++) {
                            if (count < 2) {
                              if (j + 1 <= val.length) {
                                if (val.substring(i, i + 1) ==
                                    val.substring(j, j + 1)) {
                                  count++;
                                } else {
                                  chk_txt2 = true;
                                }
                              } else {
                                chk_txt2 = true;
                              }
                            } else {
                              chk_txt2 = false;
                            }
                          }
                          i++;
                        }
                      } else {
                        chk_txt2 = false;
                      }
                      widget.onInit!();
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: AppTextSetting.primaryColor,
                    style: const TextStyle(
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 13.0,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'ป้อนตัวเลข',
                        hintStyle: TextStyle(
                            fontSize: 10,
                            color: chk_txt2 ? Colors.green : Colors.red)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('ข้อ3. input จะต้องกันไม่ให้มีเลขเรียงกันเกิน 2 ตัว'),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 0.5, color: chk_txt3 ? Colors.green : Colors.red),
                ),
                height: 45,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 5,
                  ),
                  child: TextFormField(
                    controller: txt_number3,
                    onChanged: (val) {
                      int count1 = 0;
                      int count2 = 0;

                      if (val.length >= 6 && count1 <= 2) {
                        for (int i = 0; i < val.length; i++) {
                          for (int j = i + 1; j < val.length; j++) {
                            if (count1 < 3) {
                              if (((int.parse(val.substring(i, i + 1))) + 1)
                                      .toString() ==
                                  val.substring(j, j + 1)) {
                                count1++;

                                print('count1 : $count1');
                              } else {
                                for (int i = 0; i < val.length; i++) {
                                  for (int j = i + 1; j < val.length; j++) {
                                    if (count2 < 3) {
                                      if (((int.parse(val.substring(
                                                      i, i + 1))) -
                                                  1)
                                              .toString() ==
                                          val.substring(j, j + 1)) {
                                        count2++;
                                        print('count2 : $count2');
                                      } else {
                                        chk_txt3 = true;
                                      }
                                    } else {
                                      chk_txt3 = false;
                                    }
                                  }
                                }
                              }
                            } else {
                              chk_txt3 = false;
                            }
                          }
                        }
                      } else {
                        chk_txt3 = false;
                      }
                      widget.onInit!();
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: AppTextSetting.primaryColor,
                    style: const TextStyle(
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 13.0,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'ป้อนตัวเลข',
                        hintStyle: TextStyle(
                            fontSize: 10,
                            color: chk_txt3 ? Colors.green : Colors.red)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('ข้อ4. input จะต้องกันไม่ให้มีเลขชุดซ้ำ เกิน 2 ชุด'),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 0.5, color: chk_txt4 ? Colors.green : Colors.red),
                ),
                height: 45,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 5,
                  ),
                  child: TextFormField(
                    controller: txt_number4,
                    onChanged: (val) {
                      int count = 0;

                      if (val.length >= 6) {
                        for (int i = 0; i < val.length; i++) {
                          for (int j = i + 1; j <= i + 1; j++) {
                            if (count < 3) {
                              if (j + 1 <= val.length) {
                                if (val.substring(i, i + 1) ==
                                    val.substring(j, j + 1)) {
                                  count++;
                                  print(count);
                                } else {
                                  chk_txt4 = true;
                                }
                              } else {
                                chk_txt4 = true;
                              }
                            } else {
                              chk_txt4 = false;
                            }
                          }
                          i++;
                        }
                      } else {
                        chk_txt4 = false;
                      }
                      widget.onInit!();
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: AppTextSetting.primaryColor,
                    style: const TextStyle(
                      fontFamily: AppTextSetting.APP_FONT,
                      fontSize: 13.0,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'ป้อนตัวเลข',
                        hintStyle: TextStyle(
                            fontSize: 10,
                            color: chk_txt4 ? Colors.green : Colors.red)),
                  ),
                ),
              )
            ]));
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
              : test(context, heightScreen, widthScreen, state);
        });
  }
}
