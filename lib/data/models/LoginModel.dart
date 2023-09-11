class LoginModel {
  LoginModel({
      this.status,
      this.msg,
      this.role,
      this.user,
      this.token,});

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    role=json['role'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  bool? status;
  String? msg;
  String? role;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class User {
  User({
      this.id,
      this.role,
      this.name,
      this.email,
      this.phonenumber,
      this.gender,
      this.city,
      this.password,
      this.status,
      this.v,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    role = json['role'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    gender = json['gender'];
    city = json['city'];
    password = json['password'];
    role = json['role'];
    status = json['status'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? email;
  int? phonenumber;
  String? gender;
  String? city;
  String? password;
  String? role;
  String? status;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phonenumber'] = phonenumber;
    map['gender'] = gender;
    map['city'] = city;
    map['password'] = password;
    map['role'] = role;
    map['status'] = status;
    map['__v'] = v;
    return map;
  }

}