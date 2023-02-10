import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_application/ui/screens/login_signup/first_registeration_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/utils/form_validate.dart';
import 'package:new_application/widgets/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FormatAndValidate formatAndValidate = FormatAndValidate();
  TextFieldControl _name = TextFieldControl();
  TextFieldControl _emailid = TextFieldControl();
  TextFieldControl _mobileno = TextFieldControl();
  TextFieldControl _password = TextFieldControl();
  TextFieldControl _confirmpassword = TextFieldControl();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 18,right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            Text(
              "User Name",
              style: TextStyle(fontWeight: FontWeight.w500),
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
            Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.w500),
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
            Text(
              "Mobile Number",
              style: TextStyle(fontWeight: FontWeight.w500),
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
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            AppTextBox(
              textFieldControl: _password,
              prefixIcon: Icon(Icons.lock_outlined, color: primaryColor),
              hintText: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            Text(
              "Confirm password",
              style: TextStyle(fontWeight: FontWeight.w500),
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
                width: 320,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => RegisterationScreen(
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(12.0),
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
}
