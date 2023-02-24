import 'package:new_application/modelclass/user.dart';

class UserSignInDetails {
  bool? success;
  int? statusCode;
  String? message;
  User? users;
  String? token;

  UserSignInDetails(
      {this.success, this.statusCode, this.message, this.users, this.token});

  UserSignInDetails.fromJson( json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    users = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.users != null) {
      data['user'] = this.users!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
