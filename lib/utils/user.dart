import 'package:flutter/material.dart';

class UserDetails {
  static String apiToken = '';
  static String userId = '';
  static String userName = '';
  static String usernickname = '';
  static String userEmail = '';
  static String userMobile = '';


  static String userImageUrl = '';
  static ValueNotifier userImageUrlValueNotifier = ValueNotifier("");

  static void set(
      String token,
      String id,
      String name,
      String nickname,
      String email,
      String mobile,
      ) {
    apiToken = token;
    userId = id;
    userName = name;
    userEmail = email;
    userMobile = mobile;

  }
}
