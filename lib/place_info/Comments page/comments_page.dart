
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  bool isVisbile = false;
  var placecubit;
  @override
  void initState() {
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFfafafa),
      appBar: AppBar(
        title: const Text('Comments'),
        elevation: 1,
        backgroundColor: Colors.cyan,
        shadowColor: Colors.grey,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage('images/avatar.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Mohammed Ali',
                        style: TextStyle(color: Color(0xff909090)),
                      ),
                      Spacer(),
                      Text('2 h ago',
                          style: TextStyle(color: Color(0xff909090)))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 56.0, right: 12),
                  child: Text(
                      'All-electric vehicles, also referred to as battery electric vehicles (BEVs), have an electric motor instead of an internal combustion engine. The vehicle uses a large traction battery pack to power the electric motor and must be plugged in to a wall outlet or charging equipment'),
                ),
                TextButton(
                    onPressed: () {
                  
                      setState(() {
                        isVisbile = !isVisbile;
                      });
                    },
                    child: Text(
                        isVisbile ? 'Hide owner replay' : 'Show owner replay',
                        style: TextStyle(
                          color: Colors.blue[400],
                        ))),
                OwnerReplay(isVisbile: isVisbile),
                const Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OwnerReplay extends StatelessWidget {
  const OwnerReplay({
    super.key,
    required this.isVisbile,
  });

  final bool isVisbile;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisbile,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Place owner name',
                    style: TextStyle(color: Color(0xff909090), fontSize: 18)),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 14),
              child: Text('Thank you for your opinon'),
            )
          ],
        ),
      ),
    );
  }
}
