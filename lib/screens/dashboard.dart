import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:test_neversitup/controllers/baseController.dart';
import 'package:test_neversitup/controllers/dashboardController.dart';
import 'package:test_neversitup/models/appState.dart';
import 'package:test_neversitup/models/appTextSetting.dart';
import 'package:test_neversitup/screens/utilitys/myStyle.dart';

class Dashboard extends StatefulWidget {
  static const String id = "Dashboard";
  final void Function()? onInit;
  const Dashboard({Key? key, required this.onInit}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  BaseController baseController = BaseController();
  DashboardController dashboardController = DashboardController();
  Timer? _timer;
  int _start = 60;
  bool isLoading = true;
  dynamic _item;
  List<dynamic> _history = [];
  double? _usd;
  double? _gbp;
  double? _eur;
  TextEditingController txt_number = TextEditingController();
  double result = 0;

  dynamic _ddlType = [
    {'id': '1', 'name': 'USD'},
    {'id': '2', 'name': 'GBP'},
    {'id': '3', 'name': 'EUR'},
  ];

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          _start = 60;
          loadData();
          widget.onInit!();
        } else {
          _start--;
          widget.onInit!();
        }
      },
    );
  }

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
    txt_number.text = "0";
    _item = await dashboardController.getDataBTC();
    isLoading = false;
    startTimer();

    if (_item != null) {
      _usd = 1 / _item['USD']['rate_float'];
      _gbp = 1 / _item['GBP']['rate_float'];
      _eur = 1 / _item['EUR']['rate_float'];

      _history.add(_item);
    }
    widget.onInit!();
  }

  calBTC() async {
    result = AppTextSetting.SELECT_DDL_TYPE == "1"
        ? double.parse(txt_number.text) * _usd!
        : AppTextSetting.SELECT_DDL_TYPE == '2'
            ? double.parse(txt_number.text) * _gbp!
            : double.parse(txt_number.text) * _eur!;
  }

  Container dashboard(BuildContext context, double heightScreen,
      double widthScreen, AppState state) {
    return Container(
      child: Column(
        children: [
          Text(
            'ราคา 1 เหรียญ BTC ต่อ สกุลเงิน',
            style: TextStyle(
              fontFamily: AppTextSetting.APP_FONT,
              fontSize: 13.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(child: Text('USD = ${_item['USD']['rate']}')),
          Center(child: Text('GBP = ${_item['GBP']['rate']}')),
          Center(child: Text('EUR = ${_item['EUR']['rate']}')),
          SizedBox(
            height: 10,
          ),
          Text(
            'กรุณาป้อนตัวเลขและเลือกประเภทสกุลเงินที่ต้องการแปลงค่าเป็น BTC',
            style: TextStyle(
              fontFamily: AppTextSetting.APP_FONT,
              fontSize: 13.0,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 0.05,
                      ),
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
                        controller: txt_number,
                        onChanged: (val) {
                          if (val != "".trim() && val != "0".trim()) {
                            calBTC();
                          }
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
                            hintText: 'ป้อนตัวเลขที่ต้องการแปลงเป็น BTC',
                            hintStyle: TextStyle(fontSize: 10)),
                      ),
                    ),
                  )),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 0.05,
                    ),
                  ),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButtonHideUnderline(
                    child: Center(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: DropdownButton(
                            value: AppTextSetting.SELECT_DDL_TYPE,
                            icon: FaIcon(
                              Icons.expand_more,
                              color: Colors.grey,
                              size: 13,
                            ),
                            isExpanded: true,
                            hint: Text(
                              'select type',
                              style: TextStyle(
                                  fontFamily: AppTextSetting.APP_FONT,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.grey[500]),
                            ),
                            items: [
                              for (var item in _ddlType) item,
                            ].map<DropdownMenuItem<String>>((var item) {
                              //print(item);
                              return DropdownMenuItem<String>(
                                value: item['id'].toString(),
                                child: Text(item['name'].toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontFamily: AppTextSetting.APP_FONT,
                                        fontWeight: FontWeight.bold)),
                              );
                            }).toList(),
                            onChanged: (value) async {
                              AppTextSetting.SELECT_DDL_TYPE = value.toString();
                              calBTC();
                              widget.onInit!();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text('BTC = $result'),
          SizedBox(
            height: 10,
          ),
          Text('ประวัติราคาย้อนหลัง'),
          Column(
            children: listhistory(context, heightScreen, widthScreen, _history),
          )
        ],
      ),
    );
  }

  List<Widget> listhistory(BuildContext context, double heightScreen,
      double widthScreen, dynamic item) {
    List<Widget> card = [];

    for (var items in item) {
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
                  Expanded(
                      flex: 1, child: Text('USD = ${items['USD']['rate']}')),
                  Expanded(
                      flex: 1, child: Text('GBP = ${items['GBP']['rate']}')),
                  Expanded(
                      flex: 1, child: Text('EUR = ${items['EUR']['rate']}')),
                ],
              )
            ],
          )));
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
              : dashboard(context, heightScreen, widthScreen, state);
        });
  }
}
