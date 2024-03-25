
import 'package:ema/place_info/General%20page/general_page.dart';
import 'package:ema/place_info/Offers%20Page/offers_page.dart';
import 'package:flutter/material.dart';
import 'package:ema/Models/places.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({super.key, required this.place});
  final PlaceModel place;

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
          //  backgroundColor: Colors.grey,
          title: Text(widget.place.placeName),
          bottom: const TabBar(tabs: [
            Tab(text: 'General'),
            Tab(
              text: 'Offers',
            ),
            Tab(
              text: 'Comments',
            )
          ]),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [GeneralPage(), OffersPage(), MyWidget()],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double userRate = 0.0;
    return IconButton(
        onPressed: () {
          RateDialog(context, userRate);
        },
        icon: Icon(Icons.access_alarms_rounded));
  }

  Future<dynamic> RateDialog(BuildContext context, double userRate) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shadowColor: Colors.grey,
            child: Container(          
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Rate the place',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  RatingBar.builder(
                      initialRating: userRate,
                      minRating: 0,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2),
                      allowHalfRating: true,
                      itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {
                        print(rating);
                        userRate = rating;
                      }),
                ],
              ),
            ),
          );
        });
  }
}
