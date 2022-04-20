import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:panni/providers/checkout_provider.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:provider/provider.dart';

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({Key? key}) : super(key: key);

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers = {};
  late LocationData globalLocationData;

  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      globalLocationData = loc;
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: MyAppBar(title: "Location", isHome: false),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(48.8561, 2.2930),
                  zoom: 100,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
                markers: _markers,
              ),
              Positioned(
                  bottom: 15,
                  left: MediaQuery.of(context).size.width / 4.5,
                  right: MediaQuery.of(context).size.width / 6,
                  child: InkWell(
                    onTap: () async {
                      checkoutProvider.setLocation = globalLocationData;
                      Fluttertoast.showToast(msg: "Location is Set");
                      Navigator.pop(context);
                      // await loc.getLocation().then((value) {
                      //   setState(() {
                      //     // checkoutProvider.setLocation = value;
                      //     // Fluttertoast.showToast(msg: "Location is Set");

                      //     // Navigator.pop(context);
                      //   });
                      // }).catchError((e) {
                      //   Fluttertoast.showToast(msg: e.toString());
                      // });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0f5e9c),
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text("Set Location",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ))
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF0f5e9c),
        child: Icon(
          Icons.location_searching,
          color: Colors.white,
        ),
        onPressed: () {
          getLocation();
        },
      ),
    );
  }
}
