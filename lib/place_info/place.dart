import 'package:ema/place_info/General%20page/general_page.dart';
import 'package:flutter/material.dart';
import 'package:ema/Models/places.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({super.key, required this.place});
  final Places place;

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
          children: [
            GeneralPage(),
            Text('offers'),
            Text('comments'),
          ],
        ),
      ),
    );
  }
}
