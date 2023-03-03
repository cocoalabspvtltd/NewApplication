import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_application/ui/screens/hotel/hotel_details_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/widgets/app_text_field.dart';


class StartHotelScreen extends StatefulWidget {
  const StartHotelScreen({Key? key}) : super(key: key);

  @override
  State<StartHotelScreen> createState() => _StartHotelScreenState();
}

class _StartHotelScreenState extends State<StartHotelScreen> {
  final TextFieldControl _searchcontroller = TextFieldControl();
  final TextFieldControl _nodaysnights = TextFieldControl();
  final TextFieldControl _minbudget = TextFieldControl();
  final TextFieldControl _maxbudget = TextFieldControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: primaryColor,
        title: const Text(
          "Hotels",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text("Location where you need\naccommodation",style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 20
                ),),
                SizedBox(height: 6,),
                AppTextBox(
                  textFieldControl: _searchcontroller,
                  hintText: 'Search location',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.search),
                ),
                Row(
                  children: [
                    Text("Number of days/nights",style: TextStyle(fontSize: 17),),
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                      child: AppTextBox(
                        textFieldControl: _nodaysnights,
                        hintText: '01',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Text("Budget per\nday/night",style: TextStyle(fontSize: 17),),
                    SizedBox(width: 80,),
                    Column(
                      children: [
                        Text("Min"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                          child: AppTextBox(
                            textFieldControl: _minbudget,
                            hintText: '₹500',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text("Max"),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                          child: AppTextBox(
                            textFieldControl: _maxbudget,
                            hintText: '₹1500',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Text("Chech in time",style: TextStyle(fontSize: 17),),
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: AppTextBox(
                        textFieldControl: _nodaysnights,
                        hintText: '11:00 AM ',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: (){
                      }, child: const Text("Confirm",style: TextStyle(fontSize: 18),)),
                ),
                Divider(
                  color: Colors.black,
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.24,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onPressed: () {
                        },
                        child: Row(
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Icon(Icons.filter_alt_outlined,color: Colors.black,)
                          ],
                        )),
                  ),
                ),
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 4,
                    );
                  },
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(() => const HotelDetailsScreen());
                      },
                      child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(7))),
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/HoteleExm.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Hotel Name"),
                                        Spacer(),
                                        Text("Price")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Type"),
                                        Spacer(),
                                        Text("Per day/night")
                                      ],
                                    ),
                                  )
                                ],
                              )
                          )),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
