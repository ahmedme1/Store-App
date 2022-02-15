import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Api {
  Future<dynamic> get({required String url, @required String? token}) async
  {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({
        'Authorization': 'Bearer $token'
      });
      http.Response response = await http.get(Uri.parse(url), headers: header);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error with ${response.statusCode}');
      }
    }
  }

  Future<dynamic> Post(
      {required String url, @required dynamic body, @required String? token}) async
  {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({
        'Authorization': 'Bearer $token'
      });
    }
    http.Response response = await http.post(Uri.parse(url),
      body: body,
      headers: header,
    );
    if (response.statusCode == 200) {


      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'Error with ${response.statusCode} with body ${jsonDecode(
              response.body)}');
    }
  }


  Future<dynamic> Put(
      {required String url, @required dynamic body, @required String? token}) async
  {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({
        'Authorization': 'Bearer $token'
      });
    }
    print('url = $url , body = $body , token = $token');
    http.Response response = await http.post(Uri.parse(url),
      body: body,
      headers: header,
    );
    header.addAll({
      'Content-Type': 'application/x-www-form-urlencoded'
    });
    if (response.statusCode == 200) {

      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Error with ${response.statusCode} with body ${jsonDecode(
          response.body)}');
    }
  }
}