import 'dart:async';

import 'package:ema/place_info/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ema/Models/places.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  List<PlaceModel> places = allPlaces;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.5410, 49.1242),
    zoom: 14,
  );
  @override
  Widget build(BuildContext context) {

    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: (location) {
        // print(location.latitude);
        // print(location.longitude);
      },
      circles: {
        ...places.map(
          (e) {
            return Circle(
              circleId: CircleId(e.placeName),
              center: LatLng(e.lat, e.lng),
              radius: 10,
              strokeWidth: 1,
              onTap: () {
                print('object1');
              },
            );
          },
        )
      },
      markers: {
        ...places.map(
          (place) {
            return Marker(
              markerId: MarkerId(place.placeName),
              position: LatLng(place.lat, place.lng),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    final placeInfo = place;
                    return CustomeShowModalBottomSheet(
                      place: placeInfo,
                    );
                  },
                );
              },
            );
          },
        )
      },
    );
  }
}

class CustomeShowModalBottomSheet extends StatelessWidget {
  const CustomeShowModalBottomSheet({
    super.key,
    required this.place,
  });
  final PlaceModel place;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 100,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Text(
            place.placeName,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PlacePage(place: place);
                  },
                ));
              },
              child: Text(
                'Go to ${place.placeName} Place Page',
                style: const TextStyle(),
              ))
        ],
      ),
    );
  }
}
