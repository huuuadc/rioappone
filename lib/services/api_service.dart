import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rioappone/models/signin_request_model.dart';
import 'package:rioappone/models/signin_responce_model.dart';
import 'package:rioappone/models/signup_request_model.dart';
import 'package:rioappone/models/signup_responce_model.dart';
//import 'package:rioappone/services/api_manager.dart';

// import 'package:flutter_login_register_nodejs/models/register_request_model.dart';
// import 'package:flutter_login_register_nodejs/models/register_response_model.dart';
import 'package:http/http.dart' as http;

import 'config.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(
    SigInRequestModel model,
  ) async {
    try {
      var url = Uri.http(
        Config.apiURL,
        Config.loginAPI,
      );

      // ignore: unused_local_variable
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        //'Authorization': 'Basic ${loginDetails.data!.token}'
      };

      debugPrint('movieTitle: $url');
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      debugPrint('movieTitle: ${response.body}');
      SignIndata res = SignIndata.fromJson(jsonDecode(response.body));
      // ignore: un necessary_brace_in_string_interps
      if (response.statusCode == 200) {
        if (res.status == 'STATUS_SUCCESS') {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  static Future<bool> sigup(
    SignUpRequestModel model,
  ) async {
    try {
      var url = Uri.http(
        Config.apiURL,
        Config.sigupAPI,
      );

      // ignore: unused_local_variable
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        //'Authorization': 'Basic ${loginDetails.data!.token}'
      };

      debugPrint('movieTitle: $url');
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      debugPrint('movieTitle: ${response.body}');
      // ignore: un necessary_brace_in_string_interps
      if (response.statusCode == 200) {
        SignUpdata res = SignUpdata.fromJson(jsonDecode(response.body));
        if (res.status == 'STATUS_SUCCESS') {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  // static Future<String> getUserProfile() async {
  //   var loginDetails = await SharedService.loginDetails();

  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Basic ${loginDetails.data!.token}'
  //   };

  //   var url = Uri.http(Config.apiURL, Config.userProfileAPI);

  //   var response = await client.get(
  //     url,
  //     headers: requestHeaders,
  //   );

  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "";
  //   }
  // }
}
