import 'package:flutter/material.dart';
import 'package:ema/Models/places.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({super.key, required this.place});
  final Places place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(place.placeName),
        centerTitle: true,
      ),
    );
  }
}
