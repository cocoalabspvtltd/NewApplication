// class LoginModelClass {
//   bool? success;
//   int? statusCode;
//   String? message;
//   User? user;
//   String? token;
//
//   LoginModelClass(
//       {this.success, this.statusCode, this.message, this.user, this.token});
//
//   LoginModelClass.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     statusCode = json['status_code'];
//     message = json['message'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['status_code'] = this.statusCode;
//     data['message'] = this.message;
//     if (this.user != null) {
//       data['user'] = this.user.toJson();
//     }
//     data['token'] = this.token;
//     return data;
//   }
// }
//
// class User {
//   int id;
//   String name;
//   String email;
//   String nickName;
//   String phone;
//   Null emailVerifiedAt;
//   Null profilePic;
//   int isAdmin;
//   int isCrm;
//   Null crmSection;
//   int isTraveller;
//   int isDriver;
//   int isHotel;
//   int isRestaurant;
//   String createdAt;
//   String updatedAt;
//   Null deletedAt;
//
//   User(
//       {this.id,
//         this.name,
//         this.email,
//         this.nickName,
//         this.phone,
//         this.emailVerifiedAt,
//         this.profilePic,
//         this.isAdmin,
//         this.isCrm,
//         this.crmSection,
//         this.isTraveller,
//         this.isDriver,
//         this.isHotel,
//         this.isRestaurant,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     nickName = json['nick_name'];
//     phone = json['phone'];
//     emailVerifiedAt = json['email_verified_at'];
//     profilePic = json['profile_pic'];
//     isAdmin = json['is_admin'];
//     isCrm = json['is_crm'];
//     crmSection = json['crm_section'];
//     isTraveller = json['is_traveller'];
//     isDriver = json['is_driver'];
//     isHotel = json['is_hotel'];
//     isRestaurant = json['is_restaurant'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['nick_name'] = this.nickName;
//     data['phone'] = this.phone;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['profile_pic'] = this.profilePic;
//     data['is_admin'] = this.isAdmin;
//     data['is_crm'] = this.isCrm;
//     data['crm_section'] = this.crmSection;
//     data['is_traveller'] = this.isTraveller;
//     data['is_driver'] = this.isDriver;
//     data['is_hotel'] = this.isHotel;
//     data['is_restaurant'] = this.isRestaurant;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     return data;
//   }
// }