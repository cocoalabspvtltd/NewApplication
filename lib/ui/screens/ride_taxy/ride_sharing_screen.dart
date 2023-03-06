import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_application/ui/screens/ride_taxy/mypool_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: const Text(
          "Ride sharing",
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
                          onPressed: () {},
                          child: const Text(
                            "Invites",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Get.to(() => const MyPoolScreen());
                          },
                          child: const Text(
                            "My pool",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Users on this route",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(color: Colors.black)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 4,
                        );
                      },
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int i) {
                        return Card(
                            elevation: 1,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8,bottom: 8),
                              child: ListTile(
                                isThreeLine: true,
                                title: const Text('Name :  ',
                                    style: TextStyle(fontSize: 18)),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Distance :   ',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CircleAvatar(
                                            radius: 16,
                                            backgroundColor: secondaryColor,
                                            child: IconButton(
                                              onPressed: () {
                                                Uri phoneno = Uri.parse('tel:+917560911122');
                                                launchUrl(phoneno);
                                              },
                                              icon: const Icon(Icons.call,
                                                color: Colors.black,size: 15,),
                                            ),
                                          ),
                                          const SizedBox(width: 7,),
                                          CircleAvatar(
                                            radius: 16,
                                            backgroundColor: secondaryColor,
                                            child: IconButton(
                                              onPressed: () {
                                                var sms = Uri.parse("sms:+917560911122");
                                                launchUrl(sms);
                                              },
                                              icon: const Icon(Icons.message,
                                                color: Colors.black,size: 15,),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Drivers on this route",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(7)),
                      border: Border.all(color: Colors.black)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 4,
                        );
                      },
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int i) {
                        return Card(
                            elevation: 1,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8,bottom: 8),
                              child: ListTile(
                                isThreeLine: true,
                                title: const Text('Name :  ',
                                    style: TextStyle(fontSize: 18)),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Distance :   ',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CircleAvatar(
                                            radius: 16,
                                            backgroundColor: secondaryColor,
                                            child: IconButton(
                                              onPressed: () {
                                                Uri phoneno = Uri.parse('tel:+917560911122');
                                                launchUrl(phoneno);
                                              },
                                              icon: const Icon(Icons.call,
                                                color: Colors.black,size: 15,),
                                            ),
                                          ),
                                          const SizedBox(width: 7,),
                                          CircleAvatar(
                                            radius: 16,
                                            backgroundColor: secondaryColor,
                                            child: IconButton(
                                              onPressed: () {
                                                var sms = Uri.parse("sms:+917560911122");
                                                launchUrl(sms);
                                              },
                                              icon: const Icon(Icons.message,
                                                color: Colors.black,size: 15,),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
