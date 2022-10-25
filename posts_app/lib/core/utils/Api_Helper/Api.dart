import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:posts_app/core/error/Exception.dart';

class Api {
  Future<dynamic> Get({required String Url, @required String? Token}) async {
    Map<String, String> headers = {};
    if (Token != null) {
      headers.addAll({});
      headers.addAll({});
    }

    http.Response response = await http.get(Uri.parse(Url), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw ServerException();
    }
  }

  Future<dynamic> Post(
      {required String Url,
      @required dynamic body,
      @required String? Token}) async {
    Map<String, String> headers = {};
    if (Token != null) {
      headers.addAll({'Authorization': 'Bearer $Token'});
    }

    http.Response response =
        await http.post(Uri.parse(Url), body: body, headers: headers);
    if (response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw ServerException();
    }
  }

  Future<dynamic> Put(
      {required String Url,
      @required dynamic body,
      @required String? Token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});

    if (Token != null) {
      headers.addAll({'Authorization': 'Bearer $Token'});
    }

    print('Url:$Url and body =$body and token= $Token');
    http.Response response =
        await http.put(Uri.parse(Url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw ServerException();
    }
  }

  Future<dynamic> delete({required String Url, @required String? Token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});

    if (Token != null) {
      headers.addAll({'Authorization': 'Bearer $Token'});
    }
    http.Response response =
        await http.delete(Uri.parse(Url), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw ServerException();
    }
  }
}
