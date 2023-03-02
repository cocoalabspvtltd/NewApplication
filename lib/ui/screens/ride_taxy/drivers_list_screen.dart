import 'package:flutter/material.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class DriversListScreen extends StatefulWidget {
  const DriversListScreen({Key? key}) : super(key: key);

  @override
  State<DriversListScreen> createState() => _DriversListScreenState();
}

class _DriversListScreenState extends State<DriversListScreen> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: primaryColor,
        title: const Text(
          "Drivers",
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
                const SizedBox(height: 10),
                const Text("Select Your Driver",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 4,
                    );
                  },
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        elevation: 1,
                        color: selectedIndex == index
                            ? secondaryColor
                            : Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(7))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: ListTile(
                            selected: selectedIndex == index ? true : false,
                            isThreeLine: true,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: selectedIndex == index
                                          ? Colors.white
                                          : secondaryColor,
                                      child: IconButton(
                                        onPressed: () {
                                          Uri phoneno = Uri.parse(
                                              'tel:+917560911122');
                                          launchUrl(phoneno);
                                        },
                                        icon: const Icon(Icons.call,
                                          color: Colors.black, size: 15,),
                                      ),
                                    ),
                                    SizedBox(width: 7,),
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: selectedIndex == index
                                          ? Colors.white
                                          : secondaryColor,
                                      child: IconButton(
                                        onPressed: () {
                                          var sms = Uri.parse(
                                              "sms:+917560911122");
                                          launchUrl(sms);
                                        },
                                        icon: Icon(Icons.message,
                                          color: Colors.black, size: 15,),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Name :  ',
                                    style: TextStyle(fontSize: 18,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,)),
                                SizedBox(height: 5,),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Place :   ',
                                  style: TextStyle(
                                    fontSize: 18, color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                    'Type :   ',
                                    style: TextStyle(fontSize: 18,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,)
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          _handleAtachmentPressed();
        },
        label: const Text('Confirm', style: TextStyle(fontSize: 16),),
      ),

    );
  }
  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: 144,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Name "),
                  Spacer(),
                  Text("V-Number")
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("Distance "),
                  Spacer(),
                  Text("Type")
                ],
              ),
              SizedBox(height: 8,),
              Divider(
                thickness: 0.5,color: Colors.black,
              ),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                    },
                    child: Text(
                      "Cancel the ride",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
