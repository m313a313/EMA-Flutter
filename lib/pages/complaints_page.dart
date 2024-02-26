import 'package:flutter/material.dart';
import 'package:ema/Models/complaints.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key, required this.complaints});
  final ComplaintsModel complaints;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Complaints',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TextRow(t1: 'Your place :', t2: complaints.placeName),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'The Discuption',
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  Text(complaints.descruption),
                  // TextRow(t1: 'Your Des :', t2: complaints.descruption),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'The Discuption',
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  Text(complaints.text)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.t1,
    required this.t2,
  });

  final String t1;
  final String t2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          t1,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.4),
            ),
            child: Text(
              t2,
              style: const TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
