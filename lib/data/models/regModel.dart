class RegModel {
  RegModel({
      this.status, 
      this.msg, 
      this.token, 
      this.data,});

  RegModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? msg;
  String? token;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    map['token'] = token;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.name, 
      this.email, 
      this.phonenumber, 
      this.gender, 
      this.city, 
      this.password, 
      this.role, 
      this.status, 
      this.id, 
      this.v,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    gender = json['gender'];
    city = json['city'];
    password = json['password'];
    role = json['role'];
    status = json['status'];
    id = json['_id'];
    v = json['__v'];
  }
  String? name;
  String? email;
  int? phonenumber;
  String? gender;
  String? city;
  String? password;
  String? role;
  String? status;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phonenumber'] = phonenumber;
    map['gender'] = gender;
    map['city'] = city;
    map['password'] = password;
    map['role'] = role;
    map['status'] = status;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}