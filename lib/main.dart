import 'package:flutter/material.dart';
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
    return BlocProvider(
        create: ((context) => AuthCubit()),
        child: MaterialApp(
          theme: ThemeData(
              useMaterial3: true,

              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              ),
          home: HomePage(),
        ));
  }
}
