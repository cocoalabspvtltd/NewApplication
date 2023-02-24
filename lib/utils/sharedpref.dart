import 'package:get/get.dart';
import 'package:new_application/modelclass/user_signin_model.dart';
import 'package:new_application/utils/user_utils.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../modelclass/user.dart';
import '../ui/screens/welcome screen.dart';

class SharedPrefs {
  static late SharedPreferences preferences;

  static String spToken = 'spToken';
  static String spUserId = 'spUserId';
  static String spEmail = 'spEmail';
  static String spName = 'spName';
  static String spMobile = 'spMobile';


  static init() async {
    print("->${spEmail}");
    preferences = await SharedPreferences.getInstance();

    UserUtils.set(
      getString(spToken),
      getString(spUserId),
      getString(spName),
      getString(spEmail),
      getString(spMobile),
    );
  }

  static String getString(String key) {
    return preferences.getString(key) ?? '';
  }

  static Future<bool> setString(String key, String value) async {
    return await preferences.setString(key, value);
  }

  static Future<bool> logIn(UserSignInDetails response) async {
    if (response.users == null) return false;

    String token = response.token ?? UserUtils.apiToken;
    print("object=?${token}");
    User userDetails = response.users!;
print("=>${userDetails.nickName}");
    await setString(spToken, '$token');
    await setString(spUserId, '${userDetails.id ?? ''}');
    await setString(spEmail, '${userDetails.email ?? ''}');
    await setString(spName, '${userDetails.name ?? ''}');
    await setString(spMobile, '${userDetails.phone ?? ''}');


    UserUtils.set(
      token,
      '${userDetails.id ?? ''}',
      '${userDetails.name ?? ''}',
      '${userDetails.email ?? ''}',
      '${userDetails.phone ?? ''}',);
    return true;
  }

  static Future<bool> logOut() async {
    await preferences.clear();
    UserUtils.set('', '', '', '', '', );

    Get.offAll(() => WelcomeScreen(isFromLogout: true));
    return true;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await preferences.setBool(key, value);
  }

  static bool getBool(String key) {
    return preferences.getBool(key) ?? false;
  }
}
