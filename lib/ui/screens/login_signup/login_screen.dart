import 'dart:io';
import 'package:flutter/material.dart';
import 'package:new_application/ui/screens/login_signup/signup_form_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/utils/form_validate.dart';
import 'package:new_application/widgets/app_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 170,
                ),
              ),
              // Center(
              //   child: Container(
              //     height: 170,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage("assets/images/logo.png"),
              //         fit: BoxFit.fitHeight,
              //       ),
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome  back",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: ElevatedButton(
                        onPressed: () {
                          signUp = false;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          primary: !signUp ? secondaryColor : Colors.grey,
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        signUp = true;
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: !signUp ? Colors.grey : secondaryColor,
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              signUp ? SignUpScreen() : _logInScreen(),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.6,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "or",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.6,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      'assets/icons/ic_facebook.png',
                      width: 16,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      'assets/icons/ic_google.png',
                      width: 24,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      'assets/icons/ic_linkedIn.png',
                      width: 24,
                    ),
                  ),
                ],
              ),
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
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20,
            bottom: 10,
          ),
          child: AppTextBox(
            textFieldControl: _email,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: primaryColor,
            ),
            hintText: 'Email id or mobile no.',
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
            prefixIcon: Icon(Icons.lock_outlined, color: primaryColor),
            hintText: 'Password',
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'Forgot Password?',
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
            ),
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: SizedBox(
            width: 310,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                "Login Now",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
