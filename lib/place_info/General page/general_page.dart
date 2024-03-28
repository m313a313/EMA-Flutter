import 'package:ema/place_info/General%20page/widgets/custom_place_imgs_listview.dart';
import 'package:ema/place_info/General%20page/widgets/place_details_container.dart';
import 'package:ema/widgts/complaint_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const CustomPlaceImagesListView(),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber[700],
                  size: 32,
                ),
                const Row(children: [
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
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ComplaintDialog(),
                );
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.flag,
                    size: 26,
                  ),
                  Text('Report')
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () => RateDialog(context),
                    icon: const Icon(Icons.star_border_rounded),
                    iconSize: 30,
                    // color: Colors.black.withOpacity(0.7)
                    ),
                Text('Add rate')
              ],
            ),
            const Column(
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: PlaceDetailsContainer(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
    );
  }
}

Future<dynamic> RateDialog(BuildContext context) {
  double userRate = 0;
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shadowColor: Colors.grey,
          child: Container(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                    TextButton(onPressed: () {}, child: Text('Send')),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
