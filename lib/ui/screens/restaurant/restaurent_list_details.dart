import 'package:flutter/material.dart';
import 'package:new_application/utils/app_helper.dart';

class RestaurentDetailsScreen extends StatefulWidget {
  const RestaurentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RestaurentDetailsScreen> createState() =>
      _RestaurentDetailsScreenState();
}

class _RestaurentDetailsScreenState extends State<RestaurentDetailsScreen> {
  final imageList = [
    'assets/images/RestaurantExm.png',
    'assets/images/RestaurantExm.png',
    'assets/images/RestaurantExm.png',
    'assets/images/RestaurantExm.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: primaryColor,
        title: const Text(
          "Restaurant",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/RestaurantExm.png",
              width: MediaQuery.of(context).size.width,
            ),
            const Padding(
                padding: EdgeInsets.only(
                  right: 120,
                ),
                child: Text("ABC Restaurent",
                    style: TextStyle(color: Colors.black, fontSize: 27))),
            const Padding(
                padding: EdgeInsets.only(left: 40, top: 10),
                child: Text("ABC Restaurent address koratty 686021",
                    style: TextStyle(color: Colors.black, fontSize: 20))),
            PageView.builder(
                itemCount: 2,
                pageSnapping: true,
                itemBuilder: (context,pagePosition){
                  return Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.network(imageList[pagePosition]));
                })

          ],
        ),
      ),
    );
  }
}
