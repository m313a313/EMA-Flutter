

import 'package:flutter/material.dart';

class PlaceDetailsContainer extends StatelessWidget {
  const PlaceDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 40,
            spreadRadius: 0,
            offset: Offset(10, 10)),
      ]),
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffE8E8E8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 2),
                    child: Text(
                      'Market',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'An electric car or electric vehicle (EV) is a passenger automobile that is propelled by an electric traction motor, using only energy stored in on-board batteries. Compared to conventional internal combustion engine (ICE) vehicles, electric cars are quieter, more responsive, have superior energy conversion efficiency and no exhaust emissions and lower overall vehicle emissions',
                  style: TextStyle(color: Color(0xff808080)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Address:',
                      style: TextStyle(color: Color(0xff808080)),
                    ),
                    Text(' Almukalla-fowah')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
