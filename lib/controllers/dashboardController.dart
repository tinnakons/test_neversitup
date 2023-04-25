import 'dart:convert';

import 'package:test_neversitup/controllers/apiController.dart';
import 'package:test_neversitup/models/url.api.dart';

class DashboardController extends APIController {
  Future<dynamic> getDataBTC() async {
    var list;
    var url = '${UrlApi.IP_ADDRESS}/v1/bpi/currentprice.json';
    var res = await getRequestJson(url);
    if (res!.statusCode == 200) {
      var result = jsonDecode(res.body);
      list = result['bpi'];
      print(list);
    } else {
      list = [];
      print('fail : ${url}');
    }
    return list;
  }
}
