import 'package:ema/Models/offers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<OffersModel> allOffer = allOffers;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: allOffer.length,
            itemBuilder: (context, index) {
              final offer = allOffer[index];
              return CustomeCardOffers(offer: offer);
            },
          ),
        )
      ],
    );
  }
}

class CustomeCardOffers extends StatefulWidget {
  const CustomeCardOffers({
    super.key,
    required this.offer,
  });

  final OffersModel offer;

  @override
  State<CustomeCardOffers> createState() => _CustomeCardOffersState();
}

class _CustomeCardOffersState extends State<CustomeCardOffers> {
    bool isF = false;
    bool isDisLike = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.offer.imgUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepPurple),
            // child: Text('data'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CostomeIconButton(
                    onPressed: () {
                       setState(() {
                        isF = !isF;
                      });
                    },
                    iconF: Icon(isF == false
                      ?Icons.favorite_border
                      :Icons.favorite,
                      ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(FontAwesomeIcons.comment)),
                ],
              ),
              Row(
                children: [
                  Text('End in:12h'),
                 CostomeIconButton(
                    onPressed: () {
                       setState(() {
                        isDisLike = !isDisLike;
                      });
                    },
                    iconF: Icon(isDisLike == false
                      ? FontAwesomeIcons.thumbsDown
                      :FontAwesomeIcons.solidThumbsDown
                      ),
                  ),
                ],
              )
            ],
          ),
          ReadMoreText(
            '${widget.offer.id}${widget.offer.text}',
            trimLines: 1,
            trimMode: TrimMode.Line,
            moreStyle: TextStyle(color: Colors.blue),
            lessStyle: TextStyle(color: Colors.redAccent[100]),
          )
        ],
      ),
    );
  }
}

class CostomeIconButton extends StatelessWidget {
  const CostomeIconButton({
    super.key,
    this.onPressed,
    required this.iconF,
  });
  final void Function()? onPressed;
  final Widget iconF;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed, icon: iconF);
  }
}
