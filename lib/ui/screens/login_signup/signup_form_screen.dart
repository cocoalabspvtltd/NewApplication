import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_application/Auth_Bloc/auth_bloc.dart';
import 'package:new_application/modelclass/user_signin_model.dart';
import 'package:new_application/ui/screens/login_signup/first_registeration_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/utils/form_validate.dart';
import 'package:new_application/utils/sharedpref.dart';
import 'package:new_application/widgets/app_dialogs.dart';
import 'package:new_application/widgets/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FormatAndValidate formatAndValidate = FormatAndValidate();
  final TextFieldControl _name = TextFieldControl();
  final TextFieldControl _nickname = TextFieldControl();
  final TextFieldControl _emailid = TextFieldControl();
  final TextFieldControl _mobileno = TextFieldControl();
  final TextFieldControl _password = TextFieldControl();
  final TextFieldControl _confirmpassword = TextFieldControl();
  AuthBlocUser _authBloc = AuthBlocUser();
  @override
  void initState() {
    _authBloc = AuthBlocUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: AppTextBox(
                textFieldControl: _name,
                prefixIcon: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
                hintText: 'Enter full name',
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(
              child: AppTextBox(
                textFieldControl: _nickname,
                prefixIcon: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
                hintText: 'Enter nick name',
                keyboardType: TextInputType.text,
              ),
            ),
            AppTextBox(
              textFieldControl: _emailid,
              prefixIcon: Icon(
                Icons.mail_outline,
                color: primaryColor,
              ),
              hintText: 'Enter mail address',
              keyboardType: TextInputType.emailAddress,
            ),
            AppTextBox(
              textFieldControl: _mobileno,
              prefixIcon: Icon(
                Icons.phone_android_outlined,
                color: primaryColor,
              ),
              hintText: 'Enter mobile number',
              keyboardType: TextInputType.number,
            ),
            AppTextBox(
              textFieldControl: _password,
              prefixIcon: Icon(Icons.lock_outlined, color: primaryColor),
              hintText: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            AppTextBox(
              textFieldControl: _confirmpassword,
              prefixIcon: Icon(Icons.lock_outlined, color: primaryColor),
              hintText: 'Confirm password',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    _validate();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _validate() async {
    var name = _name.controller.text;
    var nickname = _nickname.controller.text;
    var email = _emailid.controller.text;
    var phone = _mobileno.controller.text;
    var password = _password.controller.text;
    var confirmPassword = _confirmpassword.controller.text;
    if (formatAndValidate.validateName(name) != null) {
      return toastMessage(formatAndValidate.validateName(name));
    } else if (formatAndValidate.validateName(nickname) != null) {
      return toastMessage(formatAndValidate.validateName(nickname));
    } else if (formatAndValidate.validateEmailID(email) != null) {
      return toastMessage(formatAndValidate.validateEmailID(email));
    } else if (formatAndValidate.validatePhoneNo(phone) != null) {
      return toastMessage(formatAndValidate.validatePhoneNo(phone));
    } else if (password == "" || password.length < 6) {
      return toastMessage("Password length must be more than 6");
    } else if (password != confirmPassword) {
      return toastMessage("Password doesn't match");
    }
    return await _signUp(  name,
          nickname,phone,email,password,confirmPassword
          );
  }
  Future _signUp(
      String name,
      String nickname,
      String mobile,
      String email,

      String password, String confirmpassword,
      ) async {
    AppDialogs.loading();

    Map<String, dynamic> body = {};
    body["name"] = name;
    body["nickname"] = nickname;
    body["email"] = email;
    body["phone"] = mobile;
    body["password"] = password;
    body["password_confirmation"] = confirmpassword;
    //body["role"] = widget.isDoctor ? 2 : 3;

    try {
      UserSignInDetails response =
      await _authBloc.userRegistration(_name.controller.text,_nickname.controller.text,_mobileno.controller.text,_emailid.controller.text,_password.controller.text,_confirmpassword.controller.text);
      Get.back();
      if (response.success!) {
        debugPrint("gth->$response");
        await SharedPrefs.logIn(response);
        // if (widget.isDoctor) {
        //   //todo get to doctor module
        // } else {
          Get.offAll(() => const RegisterationScreen());
          //todo get to user module
       // }
      } else {
        toastMessage(response.message!);
      }
    } catch (e, s) {
      Completer().completeError(e, s);
      Get.back();
      toastMessage('Something went wrong. Please try again');
    }
  }
}
