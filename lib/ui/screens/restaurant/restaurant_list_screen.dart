import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_application/ui/screens/restaurant/restaurent_list_details.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/widgets/app_text_field.dart';

class ResturantListScreen extends StatefulWidget {
  const ResturantListScreen({Key? key}) : super(key: key);

  @override
  State<ResturantListScreen> createState() => _ResturantListScreenState();
}

class _ResturantListScreenState extends State<ResturantListScreen> {
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
      body: SingleChildScrollView(
        child: SafeArea(
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
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: (){
                                  // Get.to(() => const RidesharingScreen());
                                }, child: const Text("Search",style: TextStyle(fontSize: 18),)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Restuarants on\n Your way",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Spacer(),
                    ElevatedButton(
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
                  ],
                ),
                SizedBox(height: 10,),
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
                        Get.to(() => const RestaurentDetailsScreen());
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
                                Image.asset("assets/images/RestaurantExm.png"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Restuarant Name"),
                                      Spacer(),
                                      Text("Distance")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Address"),
                                      Spacer(),
                                      Text("20% off on every order")
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
