import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_neversitup/models/appState.dart';



class APIController {
  Future<http.Response?> getRequestJson(String url) async {
    //encode Map to JSON
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse(url),
      );
      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> postRequestJson(String url, Map data) async {
    //encode Map to JSON
    var body = jsonEncode(data);

    try {
      var response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: body);

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      //return null;
    }
  }

  Future<http.Response?> getRequestJsonWithToken(
      String url, AppState state) async {
    var client = new http.Client();
    try {
      var response = await client.get(Uri.parse(url),
          headers: {'authorization': 'Bearer ' + state.token});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  Future<http.Response?> postRequestJsonWithToken(
      String url, dynamic data, AppState state) async {
    var client = new http.Client();
    try {
      var response = await client.post(Uri.parse(url),
          body: data, headers: {'authorization': 'Bearer ' + state.token});

      return response;
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
      //return null;
    }
  }

  APIController();
}
