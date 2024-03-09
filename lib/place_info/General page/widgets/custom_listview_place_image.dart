import 'package:flutter/material.dart';

class CustomListViewPlaceImg extends StatelessWidget {
  const CustomListViewPlaceImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * .19,
      decoration: BoxDecoration(
          color: Colors.red,
          image: const DecorationImage(
              image: AssetImage('images/test.jpeg'), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
