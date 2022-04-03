import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:rioappone/models/searchhistoryqr.dart';
import 'package:rioappone/models/signin_request_model.dart';
import 'package:rioappone/services/config.dart';

// Future<List<Employee>> fetchEmployeeID(String id) async {
//   var url = Uri.http('203.210.237.31:3019', '/Employee/$id');
//   final response = await http.get(url);
//   if (response.statusCode == 200) {
//     return compute(parseEmployee, response.body);
//   } else {
//     return null;
//   }
// }

//Get List QR History
List<ViewSearchQRHistory> parseQRHistory(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<ViewSearchQRHistory> posts =
      list.map((model) => ViewSearchQRHistory.fromJson(model)).toList();
  return posts;
}

Future<List<ViewSearchQRHistory>?> fetchQRHistpryID(String id) async {
  var url = Uri.http('203.210.237.31:3019', '/ViewSearchQRHistory/$id');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return compute(parseQRHistory, response.body);
  } else {
    return null;
  }
}

Future<http.Response> loginapp(SigInRequestModel model) {
  // debugPrint('movieTitle: ${jsonEncode(model.toJson())}');
  return http.post(
    Uri.parse(Config.apiURLServer + '/api/v1/users/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    // body: jsonEncode(model.toJson()),
    body: jsonEncode(model.toJson()),
  );
}

Future<http.Response> checkserver() {
  // debugPrint('movieTitle: ${jsonEncode(model.toJson())}');
  return http.get(
    Uri.parse(Config.apiURLServer),
  );
}
