import 'package:flutter/material.dart';
import 'package:ema/Models/complaints.dart';
import 'package:ema/pages/complaints_page.dart';

class FavPage extends StatelessWidget {
  const FavPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ComplaintsModel> complns = allComplaints;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            const ComplaintsAppBar(),
            Expanded(
              child: ListView.builder(
                itemCount: complns.length,
                itemBuilder: (context, index) {
                  ComplaintsModel comp = complns[index];
                  return CompaintCard(comp: comp);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompaintCard extends StatefulWidget {
  const CompaintCard({
    super.key,
    required this.comp,
  });

  final ComplaintsModel comp;

  @override
  State<CompaintCard> createState() => _CompaintCardState();
}

class _CompaintCardState extends State<CompaintCard> {
  bool isF = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ComplaintPage(complaints: widget.comp);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Container(
            height: 150,
            decoration: const BoxDecoration(
                color: Color.fromARGB(77, 164, 101, 101),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      radius: 50, child: Image.asset(widget.comp.imgUrl)),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.comp.placeName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                        widget.comp.descruption,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isF = !isF;
                      });
                    },
                    icon: Icon(
                        isF == true ? Icons.favorite : Icons.favorite_border)),
              ],
            )),
      ),
    );
  }
}

class ComplaintsAppBar extends StatelessWidget {
  const ComplaintsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Here Your Fav Places',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class ListTileContainer extends StatefulWidget {
  const ListTileContainer({
    super.key,
    required this.complaints,
  });
  final ComplaintsModel complaints;

  @override
  State<ListTileContainer> createState() => _ListTileContainerState();
}

class _ListTileContainerState extends State<ListTileContainer> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
          height: 150,
          decoration: const BoxDecoration(
              color: Color.fromARGB(77, 164, 101, 101),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(radius: 50, child: Image.asset('images/logo.png')),
              Flexible(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Palce name',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                        'Descruption Descruption Descruption Descruption Descruption Descruption'),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  icon: Icon(
                      isFav == true ? Icons.favorite : Icons.favorite_border)),
            ],
          )),
    );
  }
}

        //  ListTile(
        //   leading: Image.asset('images/logo.png'),
        //   title: Text('Palce name', style: TextStyle(fontSize: 18)),
        //   subtitle: Text('Descruption'),
        //   trailing: IconButton(
        //       onPressed: () {
        //         setState(() {
        //           isFav = !isFav;
        //         });
        //       },
        //       icon:
        //           Icon(isFav == true ? Icons.favorite : Icons.favorite_border)),
        // ),