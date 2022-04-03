class SignUpdata {
  String? status;
  Data? data;
  String? message;
  num? timestamp;

  SignUpdata({this.status, this.data, this.message, this.timestamp});

  SignUpdata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['timestamp'] = timestamp;
    return data;
  }
}

class Data {
  String? username;
  String? email;
  int? id;
  String? tokenKey;

  Data({this.email, this.id, tokenKey});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    id = json['id'];
    tokenKey = json['tokenKey'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['email'] = email;
    data['id'] = id;
    data['tokenKey'] = tokenKey;
    return data;
  }
}
