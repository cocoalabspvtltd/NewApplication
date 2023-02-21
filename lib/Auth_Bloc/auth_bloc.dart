import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:new_application/modelclass/login_modelclass.dart';
import 'package:new_application/modelclass/user_signin_model.dart';
import 'package:new_application/repository/commoninfo_repository.dart';

class AuthBlocUser {
  AuthRepositoryUser? _authRepository;

  AuthBlocUser() {
    if (_authRepository == null) _authRepository = AuthRepositoryUser();
  }

  Future<UserSignInDetails> userRegistration(String name,nickname,phone,email,password,confirmpasasword) async {

    try {
      UserSignInDetails response = await _authRepository!.registerUser( name,nickname,phone,email,password,confirmpasasword);
      return response;
    } catch (e, s) {
      Completer().completeError(e, s);
      throw e;
    }
  }

  Future<UserSignInDetails> login(String body) async {
    try {
      return await _authRepository!.login(body);
    } catch (e, s) {
      Completer().completeError(e, s);
      throw e;
    }
  }
  Future<RoleModel> UserRole(String restname,restnum,resasddress,hotelname,hotelphn,hoteladd,String vehiclenum,
      String vehicleimage,
      String vehicledate,
      XFile permitimage,String type,int savevaluedriver,savevaluehoetel,savevaluerestaurent) async {
    try {
      return await _authRepository!.RoleUser( restname,restnum,resasddress,hotelname,hotelphn,hoteladd,vehiclenum,vehicleimage,vehicledate,permitimage,type,savevaluedriver,savevaluehoetel,savevaluerestaurent);
    } catch (e, s) {
      Completer().completeError(e, s);
      throw e;
    }
  }
//
// Future<UserSignUpResponse> socialLogin(String email, String name) async {
//   try {
//     return await _authRepository!.socialLogin(email, name);
//   } catch (e, s) {
//     Completer().completeError(e, s);
//     throw e;
//   }
// }
//
// Future<ForgotPassSendOtpResponse> resetPasswordSendOtp(String email) async {
//   try {
//     return await _authRepository!.resetPasswordSendOtp(email);
//   } catch (e, s) {
//     Completer().completeError(e, s);
//     throw e;
//   }
// }
//
// Future<ForgotPassVerifyOtpResponse> resetPasswordVerifyOtp(String otp) async {
//   try {
//     AppDialogs.loading();
//     ForgotPassVerifyOtpResponse response =
//     await _authRepository!.resetPasswordVerifyOtp(otp);
//     Get.back();
//     return response;
//   } catch (e, s) {
//     Get.back();
//     Completer().completeError(e, s);
//     throw e;
//   }
// }
//
// Future<ForgotPassUpdatePassResponse> resetPasswordUpdatePassword(
//     int accountId, String passwordResetToken, String password) async {
//   try {
//     return await _authRepository!
//         .resetPasswordUpdatePassword(accountId, passwordResetToken, password);
//   } catch (e, s) {
//     Completer().completeError(e, s);
//     throw e;
//   }
// }
}
