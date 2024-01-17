import 'package:trading_app/helpers/config.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class LoginDao{
  Future login(
      {required String email, required String password}) async {
    var url = 'https://reqres.in/api/login';

    print("----------_Dao 1-----------");
    Map<String, dynamic> body = {
      "email": email,
      "password": password
    };

    print("----------Dao 2-----------");

    final response = await http.post(Uri.parse(url),
        headers:Config.headers(), body: jsonEncode(body));

    print("----------Dao 3-----------");

    print("Response Status Code : ${response.statusCode}");
    print("Response body : ${response.body}");

    print("----------Dao 4-----------");

    return response;
  }
}