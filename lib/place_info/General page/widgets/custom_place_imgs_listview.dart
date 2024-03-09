import 'package:ema/place_info/General%20page/widgets/custom_listview_place_image.dart';
import 'package:flutter/material.dart';

class CustomPlaceImagesListView extends StatelessWidget {
  const CustomPlaceImagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, count) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomListViewPlaceImg(),
            );
          }),
    );
  }
}
