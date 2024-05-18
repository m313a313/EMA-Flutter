import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ema/cubit/place_cubit/place_cubit.dart';
import 'package:ema/cubit/place_cubit/place_state.dart';
import 'package:ema/helper/API.dart';
import 'package:ema/place_info/place.dart';
import 'package:ema/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ema/Models/places.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key, @required this.selectedPlace});
  final PlaceModel? selectedPlace;

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  double? latu;
  double? lngu;
  BitmapDescriptor currenLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor schoolIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor hospitalIcon = BitmapDescriptor.defaultMarker;
  bool isLoad = false;
  List<PlaceModel> places = []; //allPlaces;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late GoogleMapController? googleMapController;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.5410, 49.1242),
    zoom: 14,
  );

  @override
  void initState() {
    fetchAllPlacess();
    super.initState();
  }

  void dispose() {
    positionStream?.cancel();
    // TODO: implement dispose

    super.dispose();
  }

  void fetchAllPlacess() async {
    Duration(seconds: 6);
    // places =
    await BlocProvider.of<PlaceCubit>(context).fetchAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceCubit, PlaceState>(
      listener: (context, state) {},
      builder: (context, state) {
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
        print('$state  mmm');
        return ModalProgressHUD(
          inAsyncCall: isLoad,
          child: Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              onPressed: () {
                setMyLocation();
              },
              label: const Text('Current Location'),
              icon: const Icon(Icons.my_location_outlined),
            ),
            body: GoogleMap(
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                  _controller.complete(controller);

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
                markers: Set<Marker>.from(convertPlacesToMarkers(places))),
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
    if (darkMode == true) {
      var nightStyle = await DefaultAssetBundle.of(context)
          .loadString('assets/map_styles/night_style.json');
      googleMapController?.setMapStyle(nightStyle);
    } else
      googleMapController?.setMapStyle('[]');
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

  StreamSubscription<Position>? positionStream;
  void getLocationData() {
    positionStream = Geolocator.getPositionStream(
        locationSettings: LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 0,
    )).listen((Position locationData) {
      var cameraPostion =positionStream != null ? CameraPosition(
          zoom: 14,
          target: LatLng(locationData.latitude, locationData.longitude)):null;
          if (cameraPostion !=null){
      googleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPostion));
    }
      //بيانات موقع المستخدم اشتغل من هنا عليها عشان تضيف الماركر في الخريطة ^_^  locationData.latitude, locationData.longitude ل
    });
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

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(10, 10)),
            'assets/current_location.png')
        .then(
      (icon) {
        setState(() {
          currenLocationIcon = icon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(10, 10)), 'assets/school.png')
        .then(
      (icon) {
        setState(() {
          schoolIcon = icon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(10, 10)), 'assets/hospital.png')
        .then(
      (icon) {
        setState(() {
          hospitalIcon = icon;
        });
      },
    );
  }

  List<Marker> convertPlacesToMarkers(List<PlaceModel> places) {
    return places.map((place) {
      if (place.placeName == 'curren_location' && latu != null&& lngu != null  ) {
        return Marker(
          markerId: MarkerId(place.placeName),
          position: LatLng(latu!, lngu!),
          icon: currenLocationIcon,
        );
      } else if (place.placeCategory == 'school') {
        return Marker(
          markerId: MarkerId(place.placeName),
          position: LatLng(place.lat, place.lng),
          icon: schoolIcon,
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
      } else if (place.placeCategory == 'hospital') {
        return Marker(
          markerId: MarkerId(place.placeName),
          position: LatLng(place.lat, place.lng),
          icon: hospitalIcon,
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
      } else {
        return Marker(
          markerId: MarkerId(place.placeName),
          position: LatLng(place.lat, place.lng),
          // icon: schoolIcon,
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
      }
    }).toList();
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
              onPressed: () async {
                try {
                  Response response = await API().Get(
                      Url: '$baseUrl' '/api/user/place/${place.id}',
                      token: accessToken);
                } on Exception catch (e) {
                  // TODO
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return PlacePage(place: place);
                        },
                        settings: RouteSettings(
                            name: 'placeDetails', arguments: place)));
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
