class RegisterModelClass {
  bool? success;
  int? statusCode;
  String? message;
  User? user;
  String? token;

  RegisterModelClass(
      {this.success, this.statusCode, this.message, this.user, this.token});

  RegisterModelClass.fromJson(json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    user = json['user'] ;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? name;
  String? nickName;
  String? email;
  String? phone;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.name,
        this.nickName,
        this.email,
        this.phone,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nickName = json['nick_name'];
    email = json['email'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nick_name'] = this.nickName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}