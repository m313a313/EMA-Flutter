
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:ema/Models/user_model.dart';
import 'package:ema/Services/UserService.dart';
import 'package:ema/pages/signup_page.dart';
import 'package:ema/shared/network/local_network.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoad = true;
  bool darkMode = false;
  UserModel? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    user = await UserService().getUser();
    isLoad = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            SizedBox(
              height: 36,
              child: LiteRollingSwitch(
                width: 90,
                value: true,
                textOn: 'Light',
                textOnColor: Colors.white,
                textOff: 'Dark',
                colorOn: Colors.amber[700]!,
                colorOff: Colors.black,
                iconOn: Icons.light_mode,
                iconOff: Icons.dark_mode,
                textSize: 14,
                onChanged: (val) {
                  darkMode = val;
                  print('Current State of SWITCH IS: $darkMode');
                },
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
              ),
            ),
          ],
        ),
      ),
      body: isLoad ? const Center(child: CircularProgressIndicator())
      :Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
          child: Column(children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/avatar.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'change the profile picture',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              Icon(
                Icons.mode_edit,
                color: Colors.grey,
                size: 10,
              ),
            ]),
            Text(
              'joined in july 2023',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              indent: 3,
              endIndent: 3,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Profile information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Name',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    user?.name ?? 'uknown',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Icon(
                    size: 18,
                    Icons.mode_edit,
                    color: Colors.black.withOpacity(.6),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    user!.email,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Icon(
                    size: 18,
                    Icons.mode_edit,
                    color: Colors.black.withOpacity(.6),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Phone',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    user?.phone==null ?  'not regisered yet':user!.phone.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Icon(
                    size: 18,
                    Icons.mode_edit,
                    color: Colors.black.withOpacity(.6),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 18,
              ),
              SizedBox(width: 4),
              Text('Favorite places'),
              Spacer(
                flex: 7,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black.withOpacity(.6),
                size: 18,
              ),
              Spacer()
            ]),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Row(children: [
              Icon(
                Icons.source_outlined,
                color: Color.fromARGB(255, 5, 134, 189),
                size: 18,
              ),
              SizedBox(width: 4),
              Text('Your complaints'),
              Spacer(flex: 7),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black.withOpacity(.6),
                size: 18,
              ),
              Spacer()
            ]),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Spacer(),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                icon: Icon(Icons.change_circle),
                label: Text('Reset your password')),
            ElevatedButton.icon(
                onPressed: () {
                  LocalNetwork.clearCash();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                icon: Icon(Icons.logout),
                label: Text('Logout'))
          ]),
        ),
      ),
    );
  }
}
