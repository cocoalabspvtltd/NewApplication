import 'dart:io';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_application/repository/commoninfo_repository.dart';
import 'package:new_application/ui/screens/home.dart';
import 'package:new_application/ui/screens/login_signup/login_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/widgets/app_text_field.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  String? type;
  String typevalue = "";
  String? hoteltype;
  String hoteltypevalue="";
  XFile? _licenseimage;
  XFile? _permitimage;
  int isDriver = 0;
  int ishotel = 0;
  int isrestaurent = 0;
  final AuthRepositoryUser _authrepo = AuthRepositoryUser();
  final ImagePicker _picker = ImagePicker();
  final TextFieldControl _license_number = TextFieldControl();
  final TextFieldControl _vehicleexpdate = TextFieldControl();
  final TextFieldControl _hotelname = TextFieldControl();
  final TextFieldControl _hoteladdress = TextFieldControl();
  final TextFieldControl _hotelphoneno = TextFieldControl();
  final TextFieldControl _restaurantname = TextFieldControl();
  final TextFieldControl _restaurantno = TextFieldControl();
  final TextFieldControl _restaurantaddress = TextFieldControl();
  bool signUp = false;
  late Map value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomSheet: Container(color: primaryColor,
        child: SizedBox(
          width: 400,
          height: 40,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    _authrepo.RoleUser(
                    //     _restaurantname.controller.text,
                    //     _restaurantaddress.controller.text,
                    //     _restaurantno.controller.text,
                    //     _hotelname.controller.text,
                    //     _hotelphoneno.controller.text,
                    //     _hoteladdress.controller.text,
                    //     _license_number.controller.text,
                    // "_licenseimage as String",_vehicleexpdate.controller.text,
                    //     _permitimage!,typevalue,isDriver,ishotel,isrestaurent
                    );
                  },
                  child: const Text(" OR    Join as Traveller",style: TextStyle(color:Colors.white,fontSize: 16),)),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 140,
                      child: Image.asset(
                        "assets/images/logo.png",
                      ),
                    )),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Register Now",
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
                            Get.to(() => const LogInScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !signUp ? Colors.grey : secondaryColor,
                            shape: RoundedRectangleBorder(
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
                          backgroundColor: secondaryColor,
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
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "User Type",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                _vehicleowner(),
                const SizedBox(
                  height: 10,
                ),
                _hotelowner(),
                const SizedBox(
                  height: 10,
                ),
                _restaurantowner(),
                const SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, // Background color
                      ),
                      onPressed: (){
                    if(isDriver==1||ishotel==1||isrestaurent==1){
                      Get.to(const HomeScreen());
                    }else{
                      Fluttertoast.showToast(msg: "Please Save any User tye");
                    }
                  }, child: const Text("Next")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _vehicleowner() {
    return Theme(
      data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor)),
      child: ExpansionTileCard(
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        shadowColor: Colors.black12,
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        baseColor: Colors.grey[200],
        leading: Icon(
          CupertinoIcons.person_alt_circle,
          color: primaryColor,
        ),
        title: const Text(
          "Vehicle Owner",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          const Divider(
            thickness: 1.5,
            height: 1.0,
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.0,
              ),
              child: Text("License number",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _license_number,
              hintText: 'Enter license number',
              keyboardType: TextInputType.text,
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text("License image",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                _showpickerliscence();
              },
              child: _licenseimage != null
                  ? Container(
                      height: 80.00,
                      width: 300,
                      margin: const EdgeInsets.only(
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
                      margin: const EdgeInsets.only(
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
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Upload image",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.file_present_rounded,
                            size: 20,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: Text("license expire date",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _vehicleexpdate,
              hintText: 'Enter vehicle expire date',
              keyboardType: TextInputType.datetime,
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: Text("Vehicle permit image",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                _showpickerpermit();
              },
              child: _permitimage != null
                  ? Container(
                      height: 80.00,
                      width: 300,
                      margin: const EdgeInsets.only(
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
                      margin: const EdgeInsets.only(
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
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Upload image",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.file_present_rounded,
                            size: 20,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            width: 100,
            height: 35,
            child: ElevatedButton(
                onPressed: () {
                  if (_license_number.controller.text != null &&
                      _licenseimage != null &&
                      _vehicleexpdate != null &&
                      _permitimage != null) {
                    isDriver = 1;
                    _authrepo.RoleUservehicle(
                        _restaurantname.controller.text,
                        _restaurantaddress.controller.text,
                        _restaurantno.controller.text,
                        _hotelname.controller.text,
                        _hotelphoneno.controller.text,
                        _hoteladdress.controller.text,
                        _license_number.controller.text,
                        "_licenseimage as String",_vehicleexpdate.controller.text,_permitimage!,typevalue,isDriver,ishotel,isrestaurent);
                  //  Fluttertoast.showToast(msg: "Successfully Added");

                  } else {
                    Fluttertoast.showToast(msg: "Please fill the fields");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  _hotelowner() {
    return Theme(
      data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor)),
      child: ExpansionTileCard(
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        shadowColor: Colors.black12,
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        baseColor: Colors.grey[200],
        leading: Icon(
          CupertinoIcons.person_alt_circle,
          color: primaryColor,
        ),
        title: const Text(
          "Hotel Owner",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          const Divider(
            thickness: 1.5,
            height: 1.0,
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.0,
              ),
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
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: Text("Hotel address",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _hoteladdress,
              hintText: 'Enter hotel address',
              keyboardType: TextInputType.text,
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: Text("Enter hotel number",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _hotelphoneno,
              hintText: 'Enter hotel number',
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 'luxury',
                      groupValue: hoteltype,
                      onChanged: (value) {
                        setState(() {
                          hoteltype = value.toString();
                          hoteltypevalue = "luxury";
                          debugPrint("->${hoteltypevalue}");
                        });
                      },
                      activeColor: primaryColor,
                    ),
                    const Text(
                      "Luxury",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Radio(
                      value: 'premium',
                      groupValue: hoteltype,
                      onChanged: (value) {
                        setState(() {
                          hoteltype = value.toString();
                          hoteltypevalue = "premium";
                          debugPrint("->${hoteltypevalue}");
                        });
                      },
                      activeColor: primaryColor,
                    ),
                    const Text(
                      "Premium",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'midscale',
                      groupValue: hoteltype,
                      onChanged: (value) {
                        setState(() {
                          hoteltype = value.toString();
                          hoteltypevalue = "midscale";
                          debugPrint("->${hoteltypevalue}");
                        });
                      },
                      activeColor: primaryColor,
                    ),
                    const Text(
                      "Midscale",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Radio(
                      value: 'basic',
                      groupValue: hoteltype,
                      onChanged: (value) {
                        setState(() {
                          hoteltype = value.toString();
                          hoteltypevalue = "basic";
                          debugPrint("->${hoteltypevalue}");
                        });
                      },
                      activeColor: primaryColor,
                    ),
                    const Text(
                      "Basic",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            width: 100,
            height: 35,
            child: ElevatedButton(
                onPressed: () {
                  if (_hotelname.controller.text != null &&
                      _hoteladdress.controller.text != null &&
                      _hotelphoneno.controller.text != null) {
                    ishotel = 1;
                    _authrepo.RoleUserHotel(
                        _restaurantname.controller.text,
                        _restaurantaddress.controller.text,
                        _restaurantno.controller.text,
                        _hotelname.controller.text,
                        _hotelphoneno.controller.text,
                        _hoteladdress.controller.text,
                        _license_number.controller.text,
                        "_licenseimage as String",_vehicleexpdate.controller.text,"_permitimage as String",typevalue,isDriver,ishotel,isrestaurent);
                  } else {
                    Fluttertoast.showToast(msg: "Please fill the fields");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  _restaurantowner() {
    return Theme(
      data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor)),
      child: ExpansionTileCard(
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        shadowColor: Colors.black12,
        elevation: 8,
        borderRadius: BorderRadius.circular(15),
        baseColor: Colors.grey[200],
        leading: Icon(
          CupertinoIcons.person_alt_circle,
          color: primaryColor,
        ),
        title: const Text(
          "Restaurant Owner",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          const Divider(
            thickness: 1.5,
            height: 1.0,
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.0,
              ),
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
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: Text("Restaurant Number",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _restaurantno,
              hintText: 'Enter restaurant number',
              keyboardType: TextInputType.number,
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: Text("Restaurant address",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AppTextBox(
              textFieldControl: _restaurantaddress,
              hintText: 'Enter restaurant address',
              keyboardType: TextInputType.text,
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 5.0,
                ),
                child: Text("Restaurant type",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 'veg',
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value.toString();
                      typevalue = "veg";
                      print("->${typevalue}");
                    });
                  },
                  activeColor: primaryColor,
                ),
                const Text(
                  "Veg",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Radio(
                  value: 'non-veg',
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value.toString();
                      typevalue = "non-veg";
                      debugPrint("->${typevalue}");
                    });
                  },
                  activeColor: primaryColor,
                ),
                const Text(
                  "Non-veg",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Radio(
                  value: 'both',
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value.toString();
                      typevalue = "veg/non-veg";
                      print("->${typevalue}");
                    });
                  },
                  activeColor: primaryColor,
                ),
                const Text(
                  "Both",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            width: 100,
            height: 35,
            child: ElevatedButton(
                onPressed: () {
                  if (_restaurantname.controller.text.isNotEmpty &&
                      _restaurantno.controller.text.isNotEmpty &&
                      _restaurantaddress.controller.text.isNotEmpty) {
                    isrestaurent = 1;
                    _authrepo.RoleUserRestaurent(
                        _restaurantname.controller.text,
                        _restaurantaddress.controller.text,
                        _restaurantno.controller.text,
                        _hotelname.controller.text,
                        _hotelphoneno.controller.text,
                        _hoteladdress.controller.text,
                        _license_number.controller.text,
                        "_licenseimage as String",_vehicleexpdate.controller.text,_permitimage!,typevalue,isDriver,ishotel,isrestaurent);
                  } else {
                    Fluttertoast.showToast(msg: "Please fill the fields");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
          const SizedBox(
            height: 15,
          )
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
                          icon: const Icon(Icons.camera_alt_rounded,
                              color: Colors.white),
                          iconSize: 30,
                        ),
                      ),
                      Text("Camera"),
                    ],
                  ),
                  const SizedBox(width: 20),
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
                      const Text("Gallery"),
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
      print("image->${_permitimage}");
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
          return SizedBox(
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
                          icon: const Icon(Icons.photo),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                      ),
                      const Text("Gallery"),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
