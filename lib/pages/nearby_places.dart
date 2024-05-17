import 'dart:async';

import 'package:ema/pages/dd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

class NearbyPlaces extends StatefulWidget {
  const NearbyPlaces({super.key});

  @override
  State<NearbyPlaces> createState() => _NearbyPlacesState();
}

class _NearbyPlacesState extends State<NearbyPlaces> {
  List dropDownListData = [
    {"title": "BCA", "value": "1"},
    {"title": "MCA", "value": "2"},
    {"title": "B.Tech", "value": "3"},
    {"title": "M.Tech", "value": "4"},
  ];

  String selectedCourseValue = "";
  @override
  void initState() {
    setMyLocation();
    super.initState();
  }

  int is_container_enabled = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          const Image(
            image: AssetImage('images/near_places.png'),
            height: 240,
          ),
          Center(
            child: Text(
              'Nearby Places',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 44,
                  color: Color(0xfff54f77),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 300,
            child: Text(
                style: TextStyle(
                    color: Color.fromARGB(255, 92, 117, 144),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                'Nearby places is servie that help to find the nearest place for you from any category whice you choose.'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Choose Categoy !',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xfff54f77)),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    is_container_enabled = 1;
                    setState(() {});
                  },
                  child: CategoryContainer(
                    index: 1,
                    is_container_enabled: is_container_enabled,
                    Category: 'Masjed',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    is_container_enabled = 2;
                    setState(() {});
                  },
                  child: CategoryContainer(
                    index: 2,
                    is_container_enabled: is_container_enabled,
                    Category: 'Resturant',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    is_container_enabled = 3;
                    setState(() {});
                  },
                  child: CategoryContainer(
                    index: 3,
                    is_container_enabled: is_container_enabled,
                    Category: 'Category 3',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    is_container_enabled = 4;
                    setState(() {});
                  },
                  child: CategoryContainer(
                    index: 4,
                    is_container_enabled: is_container_enabled,
                    Category: 'Category 4',
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff54f77),
                  disabledBackgroundColor:
                      Color.fromARGB(255, 245, 90, 126).withOpacity(.9)),
              onPressed: is_container_enabled == 0 ? null : () {},
              child: const Text(
                "Find place",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> checkAndRequestLocationPremission() async {
    var premissionStatus = await Geolocator.checkPermission();
    if (premissionStatus == LocationPermission.deniedForever) {
      return false;
    }
    if (premissionStatus == LocationPermission.denied) {
      premissionStatus = await Geolocator.requestPermission();
      if (premissionStatus != LocationPermission.always ||
          premissionStatus != LocationPermission.whileInUse) {
        return false;
      }
    }
    return true;
  }

  late Position userposition;
  void getLocationData() async {
    userposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  Future<bool> checkAndRequestLocationService() async {
    bool isEnables = await Geolocator.isLocationServiceEnabled();
    if (!isEnables) {
      isEnables = await Geolocator.openLocationSettings();

      if (!isEnables) {
        return false;
      }
    }
    return true;
  }

  void setMyLocation() async {
    await checkAndRequestLocationService();
    bool hasPremission = await checkAndRequestLocationPremission();
    if (hasPremission)
      getLocationData();
    else {
      //error
    }
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key,
      required this.index,
      required this.is_container_enabled,
      required this.Category});
  final int index;
  final int is_container_enabled;
  final String Category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Color(0xfff54f77),
          ),
          color:
              is_container_enabled == index ? Color(0xfff54f77) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Center(
        child: Text(
          '$Category',
          style: TextStyle(
              color:
                  is_container_enabled == index ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
