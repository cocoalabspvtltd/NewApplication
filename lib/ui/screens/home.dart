

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:new_application/utils/sharedpref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {


    return

      Scaffold(
        key: _scaffoldKey,
        appBar:AppBar(

          elevation: 4,
          centerTitle: true,
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: (){
                    //Navigator.push(context,  MaterialPageRoute(builder: (context) => NotificationScreen()));
                  },
                  child: Stack(
                    children: [
                      Container(
                          child:
                          Icon(Icons.notifications_none_rounded,size: 25,color: Colors.white)
                      ),
                      Positioned(
                        right: 0,
                        child:  Container(
                          padding: EdgeInsets.all(1),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 13,
                            minHeight: 13,
                          ),

                        ),),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 38.0,top: 30),
                child: Text("Book Online",style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 30
                ,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Container(
                      height: 100,
                      width: 100,

                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow[700],),
                      child: Image.asset("assets/images/Vector.png"),
                    ),
                  ),
                  SizedBox(width: 20
                    ,),
                  Container(
                    height: 100,
                    width: 100,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow[700],),
                    child: Image.asset("assets/images/hotel.png"),
                  ),
                  SizedBox(width: 20
                    ,),
                  Container(
                    height: 100,
                    width: 100,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow[700],),
                    child: Image.asset("assets/images/restaurent.png"),
                  ),
                ],
              )
            ],
          ),
        ),
        drawer: _drawer(),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.grey[50],
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: Colors.green,
        //   // onTap: _onTappedItem,
        //   // currentIndex: _selectedIndex,
        //   unselectedItemColor: Colors.black,
        //   selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        //   unselectedLabelStyle:TextStyle(fontWeight: FontWeight.w500) ,
        //   items: [
        //     BottomNavigationBarItem(
        //       label: "Home",
        //       icon: Icon(Icons. home_outlined),
        //     ),
        //     BottomNavigationBarItem(
        //       label: "Events",
        //       icon:  Icon(Icons.event_available),
        //     ),
        //     BottomNavigationBarItem(
        //       label: "Match",
        //       icon: Icon(Icons.add_card_outlined),
        //     ),
        //     BottomNavigationBarItem(
        //         label: "Profile",
        //         icon:  Icon(Icons.account_box_outlined,)
        //     ),
        //   ],
        // ),
      //   body: WillPopScope(
      //       onWillPop: () {
      //         DateTime now = DateTime.now();
      //         if (currentBackPressTime == null ||
      //             now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      //           currentBackPressTime = now;
      //           Text("Double press back to exit");
      //           return Future.value(false);
      //         }
      //         return Future.value(true);
      //       }, child: Text(""),
      //       // child: _selectedIndex == 3
      //       //     ? ProfileUi()
      //       //     : _selectedIndex == 2
      //       //     ? ClubList()
      //       //     : _selectedIndex == 1
      //       //     ? events()
      //       //     : _selectedIndex == 0
      //       //     ? HomePage(RegisterName: widget.UserName1)
      //       //     : Center(child: Text("hai"))),
      // )
    );
  }
  Widget _drawer() {

    return  Drawer(
      backgroundColor: Colors.white,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child:
                  Padding(
                    padding: const EdgeInsets.only(left: 260),
                    child: Container(
                        child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => DashBoard(
                              //         UserName1: '',
                              //       )),
                              // );
                            },
                            child: Icon(CupertinoIcons.clear_circled))),
                  )),
            ),
            ListTile(
              title: Row(children: [
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Image.asset(
                //     "assets/images/mymatches.png",
                //   ),
                // ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    print("hg");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MyMatches(fragmentToShow: 0, pendingamount: '', nopaycount: '',)),
                    // );
                  },
                  // child: Text(
                  //   "My Matches",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     color: Colors.grey[900],
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ]),
            ),
            SizedBox(
              height: 4,
            ),
            ListTile(
              title: Row(children: [
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Image.asset(
                //     "assets/images/myclubs.png",
                //   ),
                // ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyClubs()));
                  },
                  // child: Text(
                  //   "My Clubs",
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.grey[900]),
                  // ),
                ),
              ]),
              onTap: () {
                // WidgetsBinding.instance!.addPostFrameCallback((_) {
                //   Navigator.pushNamed(context, RoutesName.MY_PROFILE);
                // });
              },
            ),
            ListTile(
              title: Row(children: [
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Image.asset(
                //     "assets/images/myresults.png",
                //   ),
                // ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MyResultScreen()));
                  },
                  // child: Text(
                  //   "My Results",
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.grey[900]),
                  // ),
                ),
              ]),
              onTap: () {
                // WidgetsBinding.instance!.addPostFrameCallback((_) {
                //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                // });
              },
            ),
            ListTile(
              title: Row(children: [
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Image.asset(
                //     "assets/images/history.png",width: 30,height: 20,
                //   ),
                // ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => HistoryMyMatches(fragmentToShow: 0, pendingamount: '', nopaycount: '')),
                    // );
                  },
                  // child: Text(
                  //   "History",
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.grey[900]),
                  // ),
                ),
              ]),
              onTap: () {},
            ),
            ListTile(
              title: Row(children: [
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.settings,
                        color: Colors.black, size: 22)),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900]),
                ),
              ]),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Settingpage()),
                // );
                // // WidgetsBinding.instance!.addPostFrameCallback((_) {
                //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                // });
              },
            ),
            Divider(color: Colors.grey),
            ListTile(
              title: Row(children: [
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Image.asset("assets/images/privacy.png",
                //       color: Colors.black),
                // ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PrivacyPage()));
                  },
                  child: Text(
                    "Privacy & Security",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ),
              ]),
              onTap: () {
                // WidgetsBinding.instance!.addPostFrameCallback((_) {
                //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                // });
              },
            ),
            ListTile(
              title: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:
                  Icon(Icons.call,color: Colors.black,size: 20,),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ContactPage()));
                  },
                  child: Text(
                    "Contact us",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ),
              ]),
              onTap: () {
                // WidgetsBinding.instance!.addPostFrameCallback((_) {
                //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                // });
              },
            ),
            ListTile(
              title: Row(children: [
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Image.asset(
                //     "assets/images/faq.png",
                //     color: Colors.black,
                //   ),
                // ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FaqPage()));
                  },
                  child: Text(
                    "FAQ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ),
              ]),
              onTap: () {
                // WidgetsBinding.instance!.addPostFrameCallback((_) {
                //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                // });
              },
            ),
            ListTile(
              title: Row(children: [
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Image.asset(
                //     "assets/images/about.png",
                //     height: 20,
                //   ),
                // ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AboutIUsPage()));
                  },
                  child: Text(
                    "About us",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ),
              ]),
              onTap: () {
                // WidgetsBinding.instance!.addPostFrameCallback((_) {
                //   Navigator.pushNamed(context, RoutesName.CHANGE_PASSWORD);
                // });
              },
            ),
            ListTile(
              title: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.logout, color: Colors.black),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openEndDrawer();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            'Are you sure want to log out?',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          actions: [
                            OutlinedButton(
                              child: Text('No'),
                              onPressed: () {
                               // Get.back();
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            ElevatedButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Get.back();
                                SharedPrefs.logOut();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ),
              ]),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
