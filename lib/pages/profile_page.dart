import 'package:ema/Services/UserService.dart';
import 'package:ema/cubit/theme_cubit/theme_cubit.dart';
import 'package:ema/pages/fav_page.dart';
import 'package:ema/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:ema/Models/user_model.dart';
// import 'package:ema/Services/UserService.dart';
import 'package:ema/pages/signup_page.dart';
import 'package:ema/shared/network/local_network.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoad = false;
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
      appBar: AppBarbuilder(),
      body: isLoad
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                const SizedBox(
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
                  user?.joined_at ?? 'unkwon',
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
                        user?.email ?? 'unkown',
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
                        user?.phone == null
                            ? 'not regisered yet'
                            : user!.phone.toString(),
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
                CustomeListTile(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  title: 'Favorite places',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const FavPage();
                      },
                    ));
                  },
                ),
                Divider(),
                CustomeListTile(
                  icon: Icon(
                    Icons.source_outlined,
                    color: Color.fromARGB(255, 5, 134, 189),
                  ),
                  title: 'Your complaints',
                  onTap: () {},
                ),
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
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
    );
  }

  AppBar AppBarbuilder() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(55)),
            child: SizedBox(
              height: 36,
              child: LiteRollingSwitch(
                width: 90,
                value: darkMode,
                textOn: 'Dark',
                textOnColor: Colors.white,
                textOff: 'Light',
                colorOn: Colors.black,
                colorOff: Colors.amber[700]!,
                iconOn: Icons.dark_mode,
                iconOff: Icons.light_mode,
                textSize: 14,
                onChanged: (val) {
                  BlocProvider.of<ThemeCubit>(context).SwitchTheme(value: val);

                  print('Current State of SWITCH IS: $darkMode');
                },
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomeListTile extends StatelessWidget {
  const CustomeListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final Icon icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        leading: icon,
        title: Text(title),
        trailing: IconButton(
          onPressed: onTap,
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black.withOpacity(.6),
            size: 18,
          ),
        ));
  }
}
