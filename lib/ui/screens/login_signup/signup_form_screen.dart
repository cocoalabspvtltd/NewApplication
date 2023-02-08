import 'package:flutter/material.dart';
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
  TextFieldControl _gender = TextFieldControl();
  TextFieldControl _dob = TextFieldControl();
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
            AppTextBox(
              textFieldControl: _name,
              prefixIcon: Icon(
                Icons.person,
                color: primaryColor,
              ),
              hintText: 'Select gender',
              keyboardType: TextInputType.text,
            ),
            Text(
              "Dob",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            AppTextBox(
              textFieldControl: _name,
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
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
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
