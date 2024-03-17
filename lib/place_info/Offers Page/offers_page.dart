import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/ad.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple),
                      // child: Text('data'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.heart)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.comment)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('End in:12h'),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.thumbsDown)
                                // Icon(Icons.bookmark_add_outlined)
                                ),
                          ],
                        )
                      ],
                    ),
                    ReadMoreText(
                      'askldmn flwkfw fm ekrjm fop mff  ffm e.lgfjek fwkejfwe ffwelkfwe f fwkfwefw fwi  fwf wfinwf fwfwf wfwmfowfn w d wfiwf w fw mfwiofnwfwfnwf w fc wvhs,fw',
                      trimLines: 1,
                      trimMode: TrimMode.Line,
                      moreStyle: TextStyle(color: Colors.blue),
                      lessStyle: TextStyle(color: Colors.redAccent[100]),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
