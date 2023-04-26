// ignore_for_file: camel_case_types, avoid_print, use_key_in_widget_constructors, unused_local_variable, must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class location extends StatefulWidget {
  const location({super.key});
  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Position? cl;

  CameraPosition? _kGooglePlex;

  //get current location and set it to the camera
  Future<void> getpos() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    cl = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _kGooglePlex = CameraPosition(
        target: LatLng(cl!.latitude, cl!.longitude), zoom: 14.4746);
  }

  Set<Marker> mymarker = {
//just tbadel les valeur de latitude et longitude b cl.latitude et cl.longitude bel yaatik postion mta3 l'utilisateur 1
    Marker(markerId: MarkerId("1"), position: LatLng(36.8189700, 10.1657900)),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: mymarker,
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex == null
            ? CameraPosition(target: LatLng(40, 10))
            : _kGooglePlex!,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
/*<meta-data android:name="com.google.android.geo.API_KEY"
           android:value="AIzaSyBkKs82L66jBg20jlFOGMwJL6oljrKGDV8"/>*/
/*<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>*/
/* Marker(markerId: MarkerId("1"), position: LatLng(position.l, 10.6411933)),
    Marker(markerId: MarkerId("2"), position: LatLng(35.7971833, 10.6411933))*/
