class SignUpRequestModel {
  String? email;
  String? password;

  SignUpRequestModel({
    this.email,
    this.password,
  });

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
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
