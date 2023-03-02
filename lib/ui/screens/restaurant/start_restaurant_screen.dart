import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_application/ui/screens/restaurant/restaurant_list_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/widgets/app_text_field.dart';

class StartRestaurantScreen extends StatefulWidget {
  const StartRestaurantScreen({Key? key}) : super(key: key);

  @override
  State<StartRestaurantScreen> createState() => _StartRestaurantScreenState();
}

class _StartRestaurantScreenState extends State<StartRestaurantScreen> {
  final TextFieldControl _wherelocaton = TextFieldControl();
  final TextFieldControl _tolocation = TextFieldControl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: primaryColor,
        title: const Text("Restaurant",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: 6,),
                        const Text("Search location where you need to go",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6,),
                        Row(
                          children: [
                            const Text("From",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10,),
                            SizedBox(
                              width: 240,
                              height: 50,
                              child: AppTextBox(
                                textFieldControl: _wherelocaton,
                                hintText: 'Search location',
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("To",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            const SizedBox(width: 30,),
                            SizedBox(
                              width: 240,
                              height: 50,
                              child: AppTextBox(
                                textFieldControl: _tolocation,
                                hintText: 'Search location',
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6,),
                        SizedBox(
                          width: 400,
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: (){
                                 Get.to(() => const ResturantListScreen());
                              }, child: const Text("Search",style: TextStyle(fontSize: 18),)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
