import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:new_application/Auth_Bloc/role_bloc.dart';
import 'package:new_application/LoginBloc/login_bloc.dart';
import 'package:new_application/repository/commoninfo_repository.dart';

import 'package:new_application/ui/screens/welcome%20screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/utils/sharedpref.dart';

import 'Auth_Bloc/auth_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseDatabase();
  await SharedPrefs.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {


    runApp(

        MyApp()
    );
  });

}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final geolocator =
  Geolocator.getCurrentPosition(forceAndroidLocationManager: true);

  String address = "";
  void initState() {
    super.initState();

  }


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
        '/': (BuildContext context) => const WelcomeScreen(),
        //'/home': (BuildContext context) => MyHomePage(),
      },
      initialRoute: '/',
    );
  }
}

