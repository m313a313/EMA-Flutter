import 'package:ema/cubit/place_cubit/place_cubit.dart';
import 'package:ema/pages/login_page.dart';
import 'package:ema/pages/signup_page.dart';
import 'package:ema/place_info/Comments%20page/comments_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ema/cubit/auht_cubit/auth_cubit.dart';
import 'package:ema/pages/home_page.dart';
// import 'package:ema/pages/signup_page.dart';
// import 'package:ema/pages/splash_screen.dart';
// import 'package:ema/shared/constants.dart';
import 'package:ema/shared/network/local_network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNetwork.shared_prefrence_initlzation();
//  userId = LocalNetwork.getUserIdFromCash();
  runApp(const Market());
}

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => PlaceCubit())
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,

            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: LoginPage(),
        ));
  }
}
