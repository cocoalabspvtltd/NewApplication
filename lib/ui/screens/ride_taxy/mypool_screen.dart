import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_application/ui/screens/ride_taxy/drivers_list_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPoolScreen extends StatefulWidget {
  const MyPoolScreen({Key? key}) : super(key: key);

  @override
  State<MyPoolScreen> createState() => _MyPoolScreenState();
}

class _MyPoolScreenState extends State<MyPoolScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: primaryColor,
        title: const Text(
          "My Pool",
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
                ListView.separated(
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
                            title: Row(
                              children: [
                                const Text('Name :  ',
                                    style: TextStyle(fontSize: 18)),
                                const Spacer(),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.close,size: 20,color: Colors.black,)),
                              ],
                            ),
                            subtitle: Column(
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
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.to(() => const DriversListScreen());
        },
        label: const Text('Add Driver'),
      )
    );
  }
}
