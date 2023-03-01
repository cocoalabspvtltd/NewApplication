import 'package:flutter/material.dart';
import 'package:new_application/utils/app_helper.dart';

class RidesharingScreen extends StatefulWidget {
  const RidesharingScreen({Key? key}) : super(key: key);

  @override
  State<RidesharingScreen> createState() => _RidesharingScreenState();
}

class _RidesharingScreenState extends State<RidesharingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: primaryColor,
        title: const Text("Ride sharing",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 SizedBox(
                   width: 90,
                   height: 40,
                   child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: secondaryColor,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)),
                       ),
                       onPressed: (){}, child: const Text("Invites",
                     style: TextStyle(fontSize: 18,color: Colors.black),)),
                 ),
                 SizedBox(width: 8,),
                 SizedBox(
                   width: 90,
                   height: 40,
                   child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: secondaryColor,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)),
                       ),
                       onPressed: (){}, child: Text("My pool",style: TextStyle(fontSize: 16,color: Colors.black),)),
                 )
               ],
             ),
              Text("")
            ],
          ),
        ),
      ),
    );
  }
}
