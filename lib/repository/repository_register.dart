
import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:new_application/modelclass/regioster_model.dart';
import 'package:new_application/ui/screens/home.dart';

import '../ui/screens/login_signup/first_registeration_screen.dart';

abstract class RegisterRepo {
  Future RegisterApi(String name, nickname,  phone,String email,
      password, confPassword);
  Future LoginApi(String email,
      password, );
}
class AuthRegisterRepo extends RegisterRepo {
  @override
  Future RegisterApi(String name, nickname,  phone, String email, password, confPassword) async{

var body = {"name":name,
  "nick_name":nickname,
  "email":email,
  "phone":phone,
  "password":password,
  "password_confirmation":confPassword,};
print("=>${body}");
   final  response = await http.post(Uri.parse("https://e950-117-201-137-32.ngrok.io/api/register"),
     headers: {
       "Accept": "application/json",
       "Content-Type": "application/x-www-form-urlencoded"
     },
     body:body,
   );
    print(response.body);
if(response.statusCode==200){
  Get.to(() => const RegisterationScreen());
}
      return RegisterModelClass.fromJson(response.body);



}

  Future LoginApi(String email, password, ) async{

    var body = {

      "email":email,
      "password":password,
    };
    print("=>${body}");
    final  response = await http.post(Uri.parse("https://e950-117-201-137-32.ngrok.io/api/login"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body:body,
    );
    print(response.body);
    if(response.statusCode==200){
      Get.to(() => const HomeScreen());
    }
    return RegisterModelClass.fromJson(response.body);



  }

}