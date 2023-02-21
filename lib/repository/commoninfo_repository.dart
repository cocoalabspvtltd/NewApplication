import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_application/modelclass/login_modelclass.dart';
import 'package:new_application/modelclass/user_signin_model.dart';
import 'package:new_application/repository/remoteconfig.dart';
import 'package:new_application/widgets/api_provider.dart';

String apiToken = "";

class AuthRepositoryUser {
  ApiProvider? apiClient;

  AuthRepositoryUser() {
    if (apiClient == null) apiClient = new ApiProvider();
  }

  Future<UserSignInDetails> registerUser(
      String name, nickname, phone, email, password, confirmpasasword) async {
    FormData formData = FormData.fromMap({
      "name": name,
      "nick_name": nickname,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirmation": confirmpasasword
    });
    Response response = await apiClient!
        .getJsonInstance()
        .post(ApisUser.registerUser, data: formData);
    apiToken = response.data["token"];
    return UserSignInDetails.fromJson(response.data);
  }

  Future<UserSignInDetails> login(String body) async {
    final response =
        await apiClient!.getJsonInstance().post(ApisUser.loginUser, data: body);
    return UserSignInDetails.fromJson(response.data);
  }

  // if(savevaluerestaurent ==1)
  //
  //
  // "restaurant": {
  // "name": restname,
  // "phone": resasddress,
  // "address": restnum,
  // "type": "veg"
  // }
  // else if(savevaluedriver ==1)

  // else if(savevaluehotel ==1)
  // "hotel":{
  // "hotel_name":hotelname,
  // "address":hoteladdres,
  // "hotel_phone":hotelphn
  // }



  Future<RoleModel> RoleUservehicle(
      String restname,
      restnum,
      resasddress,
      String hotelname,
      String hotelphn,
      String hoteladdres,
      String vehiclenum,
      String vehicleimage,
      String vehicledate,
      XFile permitimage,String type, int savevaluedriver,savevaluehotel,savevaluerestaurent) async {
    String fileName = permitimage.path.split('/').last;
    print("->${fileName}");
  FormData formData = FormData.fromMap({
  "is_driver": savevaluedriver,
  "driver":{
  "license_number":vehiclenum,
  "license_picture":await MultipartFile.fromFile(permitimage.path, filename:fileName),
  "exp_date":vehicledate,
  "taxi_permit":await MultipartFile.fromFile(permitimage.path, filename:fileName),
  }});
    final response =
        await apiClient!.getJsonInstance().post(ApisUser.setUserRole,
            data: formData,
            options: Options(headers: {
              'Accept': 'application/json',
              'Authorization': "Bearer " + apiToken,
            }));
    if(response.statusCode==200){
      Fluttertoast.showToast(msg: "${response.statusMessage}");
    }
    return RoleModel.fromJson(response.data);
  }
  Future<RoleModel> RoleUserHotel(
      String restname,
      restnum,
      resasddress,
      String hotelname,
      String hotelphn,
      String hoteladdres,
      String vehiclenum,
      String vehicleimage,
      String vehicledate,
      String permitimage,String type, int savevaluedriver,savevaluehotel,savevaluerestaurent) async {
    FormData formData = FormData.fromMap({
      "is_hotel": savevaluehotel,
      "hotel":{
      "hotel_name":hotelname,
      "address":hoteladdres,
      "hotel_phone":hotelphn
      }
       });
    final response =
    await apiClient!.getJsonInstance().post(ApisUser.setUserRole,
        data: formData,
        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer " + apiToken,
        }));
    if(response.statusCode==200){
      Fluttertoast.showToast(msg: "${response.statusMessage}");
    }
    return RoleModel.fromJson(response.data);
  }
  Future<RoleModel> RoleUserRestaurent(
      String restname,
      restnum,
      resasddress,
      String hotelname,
      String hotelphn,
      String hoteladdres,
      String vehiclenum,
      String vehicleimage,
      String vehicledate,
      XFile permitimage,String type, int savevaluedriver,savevaluehotel,savevaluerestaurent) async {

    FormData formData = FormData.fromMap({
      "is_restaurent": savevaluerestaurent,
      "restaurant": {
      "name": restname,
      "phone": resasddress,
      "address": restnum,
      "type": type
      }
    });
    final response =
    await apiClient!.getJsonInstance().post(ApisUser.setUserRole,
        data: formData,
        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer " + apiToken,
        }));
    if(response.statusCode==200){
      Fluttertoast.showToast(msg: "${response.statusMessage}");
    }
    return RoleModel.fromJson(response.data);
  }
  Future<RoleModel> RoleUser(

      String restname,
      restnum,
      resasddress,
      String hotelname,
      String hotelphn,
      String hoteladdres,
      String vehiclenum,
      String vehicleimage,
      String vehicledate,
      XFile permitimage,String type, int savevaluedriver,savevaluehotel,savevaluerestaurent) async {

    final response =
    await apiClient!.getJsonInstance().post(ApisUser.setUserRole,

        options: Options(headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer " + apiToken,
        }));
    if(response.statusCode==200){
      Fluttertoast.showToast(msg: "${response.statusMessage}");
    }

    return RoleModel.fromJson(response.data);
  }
}
