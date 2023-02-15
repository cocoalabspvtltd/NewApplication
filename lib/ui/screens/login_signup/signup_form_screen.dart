import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:new_application/Auth_Bloc/auth_bloc.dart';
import 'package:new_application/repository/repository_register.dart';
import 'package:new_application/ui/screens/login_signup/first_registeration_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/utils/form_validate.dart';
import 'package:new_application/widgets/app_text_field.dart';

import '../../../Auth_Bloc/auth_event.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FormatAndValidate formatAndValidate = FormatAndValidate();
  TextFieldControl _name = TextFieldControl();
  TextFieldControl _nickname = TextFieldControl();
  TextFieldControl _emailid = TextFieldControl();
  TextFieldControl _mobileno = TextFieldControl();
  TextFieldControl _password = TextFieldControl();
  TextFieldControl _confirmpassword = TextFieldControl();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.005,
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
            SizedBox(
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
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text("Continue"),
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
    return     context.read<AuthBloc>().add(Register(
        _name.controller.text,
        _nickname.controller.text,
        _mobileno.controller.text,
        _emailid.controller.text,
        _password.controller.text,
        _confirmpassword.controller.text));


  }
}
