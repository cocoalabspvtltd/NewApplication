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
                child: SizedBox(
                  height: screenHeight * 0.2,
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),)
              ),
              signUp ? Align(
                alignment: Alignment.center,
                child: Text(
                  "Register Now",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ) : Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome  back",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.05,
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
                    width: screenWidth * 0.1,
                  ),
                  SizedBox(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.05,
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
              SizedBox(height: screenHeight * 0.01,),
              signUp ? SignUpScreen() : _logInScreen(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.20,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.6,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Text(
                    "or",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  SizedBox(
                    width: screenWidth * 0.2,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.6,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.001),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
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
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
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
                        width: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
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
                        width: 20,
                      ),
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
          height: screenHeight * 0.02,
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
              onPressed: () {
                _validate();
              },
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

  _validate() async {
    var email = _email.controller.text;
    var password = _password.controller.text;

    if (formatAndValidate.validateEmailID(email) != null) {
      return toastMessage(formatAndValidate.validateEmailID(email));
    } else if (password == "" || password.length < 6) {
      return toastMessage("Password length must be more than 6");
    }
    return  toastMessage("Login Successfully") ;
  }
}
