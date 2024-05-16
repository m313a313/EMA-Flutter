import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceDetailsContainer extends StatelessWidget {
  const PlaceDetailsContainer({
    required this.desc,
    super.key,
  });
  final String desc;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.amber,
    //   child: Text('ffff'),
    // );
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black.withOpacity(.8),
                      size: 20,
                    ),
                  ),
                  Text('313', style: TextStyle(fontSize: 14))
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Description',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                desc,
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
    );
  }
}
