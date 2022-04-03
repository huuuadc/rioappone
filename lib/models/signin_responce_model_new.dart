import 'dart:convert';

SignInResponseModel loginResponseJson(String str) =>
    SignInResponseModel.fromJson(json.decode(str));

class SignInResponseModel {
  String? message;
  Data? data;

  SignInResponseModel(
    String syncData, {
    this.message,
    this.data,
  });

  SignInResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    this.username,
    this.email,
    this.id,
    this.token,
  });
  String? username;
  String? email;
  String? id;
  String? token;

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['id'] = id;
    _data['token'] = token;
    return _data;
  }
}
