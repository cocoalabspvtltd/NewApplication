import 'dart:io';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_application/ui/screens/login_signup/login_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/widgets/app_text_field.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  String? gender;
  XFile? _licenseimage;
  XFile? _permitimage;
  final ImagePicker _picker = ImagePicker();
  TextFieldControl _license_number = TextFieldControl();
  TextFieldControl _vehicleexpdate = TextFieldControl();
  TextFieldControl _hotelname = TextFieldControl();
  TextFieldControl _hoteladdress = TextFieldControl();
  TextFieldControl _hotelphoneno = TextFieldControl();
  TextFieldControl _restaurantname = TextFieldControl();
  TextFieldControl _restaurantno = TextFieldControl();
  TextFieldControl _restaurantaddress = TextFieldControl();

  bool signUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
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
                Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
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
                            Get.to(() => LogInScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            primary: !signUp ? Colors.grey : secondaryColor,
                            shape: RoundedRectangleBorder(
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
                          primary: secondaryColor,
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
                // signUp ? SignUpScreen() : _logInScreen(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "User Type",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                _vehicleowner(),
                SizedBox(
                  height: 10,
                ),
                _hotelowner(),
                SizedBox(
                  height: 10,
                ),
                _restaurantowner()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _vehicleowner() {
    return Theme(
      data: Theme.of(context).copyWith(accentColor: primaryColor),
      child: ExpansionTileCard(
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        shadowColor: primaryColor,
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        baseColor: Colors.white,
        leading: Icon(
          CupertinoIcons.person_alt_circle,
          color: primaryColor,
        ),
        title: Text(
          "Vehicle Owner",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Divider(
            thickness: 1.5,
            height: 1.0,
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,
                vertical: 5.0,),
              child: Text("License number",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _license_number,
              hintText: 'Enter license number',
              keyboardType: TextInputType.number,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, ),
                child: Text("License image",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                _showpickerliscence();
              },
              child: _licenseimage != null
                  ? Container(
                      height: 60.00,
                      width: 200,
                      margin: EdgeInsets.only(
                        top: 10.00,
                      ),
                      child: Image.file(
                        File(_licenseimage!.path),
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(
                      height: 45.00,
                      width: 300.00,
                      margin: EdgeInsets.only(
                        top: 10.00,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 230),
                        child: Icon(
                          Icons.file_present_rounded,
                          size: 20,
                          color: primaryColor,
                        ),
                      ),
                    ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,
                  vertical: 5.0,),
                child: Text("license expire date",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _vehicleexpdate,
              hintText: 'Enter vehicle expire date',
              keyboardType: TextInputType.datetime,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,
                  vertical: 5.0,),
                child: Text("Vehicle permit image",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                _showpickerpermit();
              },
              child: _permitimage != null
                  ? Container(
                height: 60.00,
                width: 200,
                margin: EdgeInsets.only(
                  top: 10.00,
                ),
                child: Image.file(
                  File(_permitimage!.path),
                  fit: BoxFit.fill,
                ),
              )
                  : Container(
                height: 45.00,
                width: 300.00,
                margin: EdgeInsets.only(
                  top: 10.00,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 230),
                  child: Icon(
                    Icons.file_present_rounded,
                    size: 20,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }

  _hotelowner() {
    return Theme(
      data: Theme.of(context).copyWith(accentColor: primaryColor),
      child: ExpansionTileCard(
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        shadowColor: primaryColor,
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        baseColor: Colors.white,
        leading: Icon(
          CupertinoIcons.person_alt_circle,
          color: primaryColor,
        ),
        title: Text(
          "Hotel Owner",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Divider(
            thickness: 1.5,
            height: 1.0,
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,
                vertical: 5.0,),
              child: Text("Hotel name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _hotelname,
              hintText: 'Enter hotel name',
              keyboardType: TextInputType.text,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,
                  vertical: 5.0,),
                child: Text("Hotel address",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _hoteladdress,
              hintText: 'Enter hotel address',
              keyboardType: TextInputType.text,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,
                  vertical: 5.0,),
                child: Text("Enter hotel number",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _hotelphoneno,
              hintText: 'Enter hotel number',
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }

  _restaurantowner() {
    return Theme(
      data: Theme.of(context).copyWith(accentColor: primaryColor),
      child: ExpansionTileCard(
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        shadowColor: primaryColor,
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        baseColor: Colors.white,
        leading: Icon(
          CupertinoIcons.person_alt_circle,
          color: primaryColor,
        ),
        title: Text(
          "Restaurant Owner",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          Divider(
            thickness: 1.5,
            height: 1.0,
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,
                vertical: 5.0,),
              child: Text("Restaurant name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _restaurantname,
              hintText: 'Enter restaurant name',
              keyboardType: TextInputType.text,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,
                  vertical: 5.0,),
                child: Text("Restaurant Number",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _restaurantno,
              hintText: 'Enter restaurant number',
              keyboardType: TextInputType.number,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,
                  vertical: 5.0,),
                child: Text("Restaurant address",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _restaurantaddress,
              hintText: 'Enter restaurant address',
              keyboardType: TextInputType.text,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,
                  vertical: 5.0,),
                child: Text("Restaurant type",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 'veg',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                  activeColor: primaryColor,
                ),
                Text(
                  "Veg",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 10,),
                Radio(
                  value: 'non-veg',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                  activeColor: primaryColor,
                ),
                Text(
                  "Non-veg",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 10,),
                Radio(
                  value: 'both',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                  activeColor: primaryColor,
                ),
                Text(
                  "Both",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }

  _imagefromGalleryliscence() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _licenseimage = image;
    });
  }

  _imagefromComeraliscence() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _licenseimage = photo;
    });
  }

  _showpickerliscence() {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: primaryColor,
                        child: IconButton(
                          onPressed: () {
                            _imagefromComeraliscence();
                          },
                          icon: Icon(Icons.camera_alt_rounded,
                              color: Colors.white),
                          iconSize: 30,
                        ),
                      ),
                      Text("Camera"),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: primaryColor,
                        child: IconButton(
                          onPressed: () {
                            _imagefromGalleryliscence();
                          },
                          icon: Icon(Icons.photo),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                      ),
                      Text("Gallery"),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imagefromGallerypermit() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _permitimage = image;
    });
  }

  _imagefromComerapermit() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _permitimage = photo;
    });
  }

  _showpickerpermit() {
    showModalBottomSheet(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: primaryColor,
                        child: IconButton(
                          onPressed: () {
                            _imagefromComerapermit();
                          },
                          icon: Icon(Icons.camera_alt_rounded,
                              color: Colors.white),
                          iconSize: 30,
                        ),
                      ),
                      Text("Camera"),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: primaryColor,
                        child: IconButton(
                          onPressed: () {
                            _imagefromGallerypermit();
                          },
                          icon: Icon(Icons.photo),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                      ),
                      Text("Gallery"),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
