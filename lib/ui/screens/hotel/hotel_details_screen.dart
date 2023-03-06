import 'package:flutter/material.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: primaryColor,
        title: const Text(
          "Hotel Description",
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
              children: [
                Image.asset("assets/images/HoteleExm.png"),
                const SizedBox(height: 10,),
                const Text("HotelName",style: TextStyle(fontSize: 30),),
                const SizedBox(height: 10,),
                const Text("Hotel Address",style: TextStyle(fontSize: 25),),
                const SizedBox(height: 10,),
                const Text("Facilities",style: TextStyle(fontSize: 25),),
                const SizedBox(height: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Facilities1"),
                    Text("Facilities2"),
                    Text("Facilities3"),
                    Text("Facilities4")
                  ],
                ),
                const SizedBox(height: 15,),
                const Text("Budget",style: TextStyle(fontSize: 20),),
                const SizedBox(height: 8,),
                Row(
                children: [
                  Text("2500",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 16),),
                  const SizedBox(width: 5,),
                  const Text("Per day/night",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                ],
                ),
                const SizedBox(height: 15,),
                const Text("Today's Rate",style: TextStyle(fontSize: 20),),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    Text("1500",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 16),),
                    const SizedBox(width: 5,),
                    const Text("Per day/night",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: secondaryColor,
                      child: IconButton(
                        onPressed: () {
                          Uri phoneno = Uri.parse(
                              'tel:+917560911122');
                          launchUrl(phoneno);
                        },
                        icon: const Icon(Icons.call,
                          color: Colors.black, size: 17,),
                      ),
                    ),
                    const SizedBox(width: 7,),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor : secondaryColor,
                      child: IconButton(
                        onPressed: () {
                          var sms = Uri.parse(
                              "sms:+917560911122");
                          launchUrl(sms);
                        },
                        icon: const Icon(Icons.message,
                          color: Colors.black, size: 17,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height *0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("1500",style: TextStyle(fontSize: 18,color: primaryColor,fontWeight: FontWeight.bold),),
                   const Text("Per day/night",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                 ],
               ),
             ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                  },
                  child: const Text(
                    "Book Now",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            ),
            const SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}
