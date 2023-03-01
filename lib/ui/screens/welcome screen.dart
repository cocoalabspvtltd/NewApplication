import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:new_application/ui/screens/login_signup/login_screen.dart';
import 'package:new_application/utils/app_helper.dart';
import 'package:place_picker/place_picker.dart';
import 'package:google_api_headers/google_api_headers.dart';

class WelcomeScreen extends StatefulWidget {
  final bool isFromLogout;

  const WelcomeScreen({Key? key,  this.isFromLogout = false}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.whileInUse) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LogInScreen()));
      return true;
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      // Placemark place = placemarks[0];
      setState(() {
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/logo.png"),),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,),
            onPressed: _getCurrentPosition,
            child:  const Text("Get Started"),
          )
        ],
      ),
    );
  }
}


class PickerDemo extends StatefulWidget {
  const PickerDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PickerDemoState();
}

class PickerDemoState extends State<PickerDemo> {
 // String googleApikey = "AIzaSyDSFXeJ_Zuy804HSkWMaK-YGzSzIXYhVJs";
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  LatLng startLocation = const LatLng(27.6602292, 85.308027);
  String location = "Search Location";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picker Example')),
      body: Stack(
          children:[

            GoogleMap( //Map widget from google_maps_flutter package
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: CameraPosition( //innital position in map
                target: startLocation, //initial position
                zoom: 14.0, //initial zoom level
              ),
              mapType: MapType.normal, //map type
              onMapCreated: (controller) { //method called when map is created
                setState(() {
                  mapController = controller;
                });
              },
              onCameraMove: (CameraPosition cameraPositiona) {
                cameraPosition = cameraPositiona;
              },
              onCameraIdle: () async {
                List<Placemark> placemarks = await placemarkFromCoordinates(cameraPosition!.target.latitude, cameraPosition!.target.longitude);
                setState(() {
                  location = placemarks.first.administrativeArea.toString() + ", " +  placemarks.first.street.toString();
                });
              },
            ),

            Center( //picker image on google map
              child: Image.asset("assets/images/picker.png", width: 80,),
            ),

            //search autoconplete input
            Positioned(  //search input bar
                top:10,
                child: InkWell(
                    onTap: () async {
                      var place = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: "AIzaSyDSFXeJ_Zuy804HSkWMaK-YGzSzIXYhVJs",
                          mode: Mode.overlay,
                          types: [],
                          strictbounds: false,
                          components: [Component(Component.country, 'np')],
                          //google_map_webservice package
                          onError: (err){
                            debugPrint('$err');
                          }
                      );
                      if(place != null){
                        setState(() {
                          location = place.description.toString();
                        });
                        //form google_maps_webservice package
                        final plist = GoogleMapsPlaces(apiKey:"AIzaSyDSFXeJ_Zuy804HSkWMaK-YGzSzIXYhVJs",
                          apiHeaders: await const GoogleApiHeaders().getHeaders(),
                          //from google_api_headers package
                        );
                        String placeid = place.placeId ?? "0";
                        final detail = await plist.getDetailsByPlaceId(placeid);
                        final geometry = detail.result.geometry!;
                        final lat = geometry.location.lat;
                        final lang = geometry.location.lng;
                        var newlatlang = LatLng(lat, lang);

                        //move map camera to selected place with animation
                        mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 17)));
                      }
                    },
                    child:Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                        child: Container(
                            padding: const EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width - 40,
                            child: ListTile(
                              leading: Image.asset("assets/images/picker.png", width: 25,),
                              title:Text(location, style: const TextStyle(fontSize: 18),),
                              trailing: const Icon(Icons.search),
                              dense: true,
                            )
                        ),
                      ),
                    )
                )
            )
          ]
      )
    );
  }

  void showPlacePicker() async {
    LocationResult? result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PlacePicker("AIzaSyDSFXeJ_Zuy804HSkWMaK-YGzSzIXYhVJs")));

    // Handle the result in your way
    debugPrint("->$result");
  }
}

