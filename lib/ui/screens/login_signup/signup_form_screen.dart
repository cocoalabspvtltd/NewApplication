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
  TextFieldControl _nickname = TextFieldControl();
  TextFieldControl _dob = TextFieldControl();
  List list=[
    {'image': 'assets/icons/ic_male.png',
    'name':'Male'},
    {'image': 'assets/icons/ic_female.png',
      'name':'Female'},
    {'image': 'assets/icons/ic_others.png',
      'name':'Others'}
  ];
  String? dropdownvalue;
  // var gender = ['Select Gender','Male', 'Female', 'Others'];
  // var gendericons=[Icon(Icons.person), Image.asset("assets/icons/ic_male.png"), Image.asset("assets/icons/ic_female.png"),
  //   Image.asset("assets/icons/ic_others.png"),
  // ];
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
              "Nick Name",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            AppTextBox(
              textFieldControl: _nickname,
              prefixIcon: Icon(
                Icons.person,
                color: primaryColor,
              ),
              hintText: 'Enter nick name',
              keyboardType: TextInputType.text,
            ),
            Text(
              "Gender",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Container(
              height: 48,
              width: 330,
              margin: EdgeInsets.symmetric(vertical: 7),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey,),
              ),
              child: DropdownButton(
                underline: Container(),
                value: dropdownvalue,
                hint: Row(
                  children: [
                    Icon(Icons.person,color: primaryColor,),
                    SizedBox(width: 8,),
                    Text("Select Gender",style: TextStyle(fontSize: 14),),
                  ],
                ),
                icon: Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Icon(Icons.arrow_drop_down_rounded,color: primaryColor,),
                ),
                onChanged: (newValue) {
                  setState(() {
                      dropdownvalue = newValue.toString();
                  });
                },
                items: list.map(( gender) {
                  return DropdownMenuItem(
                    value: gender['name'],
                    child: Row(
                      children: [
                        Image.asset(gender['image'],width: 24,),
                        SizedBox(width: 8,),
                        Text(gender['name'])
                      ],
                    ),
                  );
                }).toList(),
              ),),
            Text(
              "DOB",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            AppTextBox(
              textFieldControl: _dob,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: primaryColor,
              ),
              hintText: 'DD/MM/YY',
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 15,
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
                      borderRadius: new BorderRadius.circular(12.0),
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
