import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_application/ui/screens/login_signup/signup_form_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/utils/form_validate.dart';
import 'package:new_application/widgets/app_text_field.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key, this.doctorLogin = false}) : super(key: key);
  final bool doctorLogin;

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool signUp = false;

  FormatAndValidate formatAndValidate = FormatAndValidate();

  TextFieldControl _email = TextFieldControl();
  TextFieldControl _password = TextFieldControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * .06,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    "assets/images/logo.jpg",
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * .04,
              ),

              signUp ? SignUpScreen() : _logInScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logInScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: screenHeight * .08,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
            bottom: 10,
          ),
          child: AppTextBox(
            textFieldControl: _email,
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
          ),
          child: AppTextBox(
            textFieldControl: _password,
            prefixIcon: Icon(Icons.lock_outlined),
            hintText: 'Password',
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
        ),
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                // color: color2.withOpacity(0.6),
              ),
            ),
          ),
          onTap: () {
          },
        ),
        SizedBox(
          height: screenHeight * .08,
        ),
        Center(
          child: SizedBox(
            width: screenWidth - 40,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(),
              child: Text("Log In"),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * .04,
        ),
        Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            )),
        SizedBox(
          height: screenHeight * .04,
        ),
        InkWell(
          child: Center(
            child: Image.asset(
              'assets/icons/ic_google.png',
              width: 24,
            ),
          ),
          onTap: () {},
        ),
        // SizedBox(width:8),

        if (Platform.isIOS)
          GestureDetector(
            child: Center(
              child: Image.asset('assets/icons/ic_apple.png'),
            ),
          ),
      ],
    );
  }

}
