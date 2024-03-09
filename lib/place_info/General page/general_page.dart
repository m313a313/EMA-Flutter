import 'package:ema/place_info/General%20page/widgets/custom_place_imgs_listview.dart';
import 'package:ema/place_info/General%20page/widgets/place_details_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomPlaceImagesListView(),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber[700],
                  size: 32,
                ),
                Row(children: [
                  Text(
                    '8.5',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text('/10')
                ]),
                Text(
                  '225',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            const Column(
              children: [
                Icon(
                  Icons.flag,
                  size: 26,
                ),
                Text('Report')
              ],
            ),
            Column(
              children: [
                Icon(Icons.star_border_rounded,
                    size: 30, color: Colors.black.withOpacity(0.7)),
                Text('Add rate')
              ],
            ),
            Column(
              children: [
                Icon(Icons.comment_outlined, size: 26),
                Text('Comments'),
              ],
            ),
            Column(
              children: [Icon(Icons.add, size: 32), Text('Save')],
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PlaceDetailsContainer(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            icon: Icon(Icons.route),
            onPressed: () {},
            label: Text('Get Route'),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(30),
                padding: EdgeInsets.all(12),
                backgroundColor: Color.fromARGB(255, 102, 175, 212),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                )),
          ),
        )
      ],
    );
  }
}
