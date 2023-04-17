// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:bus/location.dart';
import 'package:flutter/material.dart ';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class recieve extends StatefulWidget {
  const recieve({super.key});

  @override
  State<recieve> createState() => _recieveState();
}

class _recieveState extends State<recieve> {
  StreamSubscription<Position>? position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(),
        drawer: Drawer(),
        backgroundColor: Color.fromARGB(255, 227, 227, 227),
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: 269,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 104, 185, 98),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(63),
                        bottomRight: Radius.circular(60))),
              ),
              Positioned(
                  top: 70,
                  left: 150,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    radius: 50,
                    child: Icon(Icons.person, size: 100),
                  )),
              Positioned(
                  top: 170,
                  left: 150,
                  child: Text(
                    "Nizar Aoun",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Container(
                width: 117,
                height: 53,
                margin: EdgeInsets.only(top: 250, left: 50),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                          spreadRadius: 1)
                    ],
                    color: Color.fromARGB(255, 198, 198, 198),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: IconButton(
                  onPressed: () {
                    position = Geolocator.getPositionStream()
                        .listen((Position? position) {
                      if (position != null) {
                        // send postion to server;
                        // {position.latitude} et {position.longitude} sont les coordonnées de l'utilisateur
                        // {position.timestamp} est le temps de la position
                        // {position.accuracy} est la précision de la position
                        // {position.altitude} est l'altitude de la position
                      }
                    });
                  },
                  icon: Icon(Icons.add_location_alt),
                  color: Color.fromARGB(255, 25, 23, 23),
                  iconSize: 40,
                ),
              ),
              Container(
                width: 117,
                height: 53,
                margin: EdgeInsets.only(top: 250, left: 230),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                          spreadRadius: 1)
                    ],
                    color: Color.fromARGB(255, 198, 198, 198),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: IconButton(
                  onPressed: () {
                    Get.to(location());
                  },
                  icon: Icon(
                    Icons.location_on_sharp,
                  ),
                  color: Color.fromARGB(255, 25, 23, 23),
                  iconSize: 40,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "image/location.png",
          )
        ]));
  }
}
