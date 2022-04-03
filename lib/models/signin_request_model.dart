class SigInRequestModel {
  String? email;
  String? password;

  SigInRequestModel({
    this.email,
    this.password,
  });

  SigInRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> _data = Map<String, dynamic>();
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}
