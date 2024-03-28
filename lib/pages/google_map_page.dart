import 'dart:async';
import 'dart:developer';

import 'package:ema/cubit/place_cubit/place_cubit.dart';
import 'package:ema/cubit/place_cubit/place_state.dart';
import 'package:ema/place_info/place.dart';
import 'package:ema/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ema/Models/places.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  bool isLoad = false;
  List<PlaceModel> places = allPlaces;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late GoogleMapController googleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.5410, 49.1242),
    zoom: 14,
  );

  @override
  void initState() {
    fetchAllPlacess();
    super.initState();
  }

  void fetchAllPlacess() {
    Duration(seconds: 5);
    BlocProvider.of<PlaceCubit>(context).fetchAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceCubit, PlaceState>(
      listener: (context, state) {
        print('$state bbb');
        if (state is PlaceInfoLoadaing) {
          print('kkkk');
          isLoad = true;
        } else if (state is PlaceInfoLoadFaild) {
          isLoad = false;
          errorDialog(context);
          log('map loaded');
        } else {
          print('ffffff');
          isLoad = false;
        }
      },
      builder: (context, state) {
        print('$state  mmm');
        return ModalProgressHUD(
          inAsyncCall: isLoad!,
          child: GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              googleMapController = controller;
              initMapStyle();
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
          ),
        );
      },
    );
  }

  Future<dynamic> errorDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Expanded(
            child: Dialog(
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Error in connection with server ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ))),
            ),
          );
        });
  }

  void initMapStyle() async {
    var nightStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/night_style.json');
        if(darkMode ==true)
        googleMapController.setMapStyle(nightStyle);
        else
        googleMapController.setMapStyle('[]');
  }
}

//Custom bottom sheet

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
                //   BlocProvider.of<PlaceCubit>(context).fetchAllPlaces();
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
