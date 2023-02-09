import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_application/ui/screens/login_signup/login_screen.dart';
import 'package:new_application/utils/app_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: primaryColor,
        colorScheme:
        ThemeData().colorScheme.copyWith(secondary: secondaryColor),
        buttonTheme:
        ButtonTheme.of(context).copyWith(buttonColor: primaryColor),
        appBarTheme: AppBarTheme.of(context).copyWith(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            color: secondaryColor,
            foregroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18)),
        canvasColor: Color(0xfff2f6fa),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (BuildContext context) => LogInScreen(),
        //'/home': (BuildContext context) => MyHomePage(),
      },
      initialRoute: '/',
    );
  }
}

