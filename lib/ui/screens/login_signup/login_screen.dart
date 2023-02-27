import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_application/Auth_Bloc/auth_bloc.dart';
import 'package:new_application/modelclass/user_signin_model.dart';
import 'package:new_application/ui/screens/home.dart';
import 'package:new_application/ui/screens/login_signup/signup_form_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/utils/form_validate.dart';
import 'package:new_application/utils/sharedpref.dart';
import 'package:new_application/widgets/app_dialogs.dart';
import 'package:new_application/widgets/app_text_field.dart';
import 'first_registeration_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  bool signUp = false;
  FormatAndValidate formatAndValidate = FormatAndValidate();
  final AuthBlocUser _loginuser = AuthBlocUser();
  final TextFieldControl _email = TextFieldControl();
  final TextFieldControl _password = TextFieldControl();

  @override



  Widget build(BuildContext context) {
   // Future.delayed(Duration.zero, () => showAlert(context));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 140,
                    child: Image.asset(
                      "assets/images/logo.png",
                    ),)
              ),
              signUp ? const Align(
                alignment: Alignment.center,
                child: Text(
                  "Register Now",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ) : const Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome  back",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
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
                          backgroundColor: !signUp ? secondaryColor : Colors.grey,
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  ),
                  const SizedBox(
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
                        backgroundColor: !signUp ? Colors.grey : secondaryColor,
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              signUp ? const SignUpScreen() : _logInScreen(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
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
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onPressed: () {debugPrint("object");
                        signup(context); },
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
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
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
  }// function to implement the google signin

// creating firebase instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const RegisterationScreen()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }


  Widget _logInScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(
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
        const SizedBox(
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
        const SizedBox(
          height: 15,
        ),
        Center(
          child: SizedBox(
            width: 310,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(12.0),
                ),
              ),
              child: GestureDetector(onTap: () async {
                debugPrint("loading");
                await _login(_email.controller.text,_password.controller.text,context);
                //await _loginuser.login(_email.controller.text,_password.controller.text,context);
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (context) => PickerDemo()));
                //
                // context.read<LoginBloc>().add(Login(
                //
                //   _email.controller.text,
                //     _password.controller.text,
                //   ));

                // await MyApp.fiam.triggerEvent('awesome_event');
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: Text('Triggering event: awesome_event'),
                //   ),
                // );

              },
                child: const Text(
                  "Login Now",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Future _login(String email,password,context) async {
    AppDialogs.loading();

    Map<String, dynamic> body = {};
    body["email"] = _email.controller.text;
    body["password"] = _password.controller.text;

    try {
      UserSignInDetails response = await _loginuser.login(email,password,context);
      debugPrint(">${response.users!.nickName}");
      Get.back();

      if (response.success!) {
        await SharedPrefs.logIn(response);
        Get.offAll(() => const HomeScreen());
      } else {
        toastMessage(response.message!);
      }
    } catch (e, s) {
      Completer().completeError(e, s);
      Get.back();
      Fluttertoast.showToast(msg:'Something went wrong. Please try again');
    }
  }
}
