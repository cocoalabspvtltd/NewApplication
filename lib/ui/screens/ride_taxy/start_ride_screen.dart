import 'package:flutter/material.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/widgets/app_text_field.dart';

class StartRideScreen extends StatefulWidget {
  const StartRideScreen({Key? key}) : super(key: key);

  @override
  State<StartRideScreen> createState() => _StartRideScreenState();
}

class _StartRideScreenState extends State<StartRideScreen> {
  final TextFieldControl _wherelocaton = TextFieldControl();
  final TextFieldControl _tolocation = TextFieldControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              const Text("Search location where you need to go",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              Row(
                children: [
                  const Text("Where",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  SizedBox(width: 6,),
                  AppTextBox(
                    textFieldControl: _wherelocaton,
                    hintText: 'Search location',
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              SizedBox(height: 10,),
             Row(
               children: [
                 const Text("To",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                 SizedBox(width: 6,),
                 AppTextBox(
                   textFieldControl: _tolocation,
                   hintText: 'Search location',
                   keyboardType: TextInputType.text,
                 ),
               ],
             ),
              SizedBox(height: 10,),
              SizedBox(
                width: 400,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: (){}, child: const Text("Search",style: TextStyle(fontSize: 18),)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
