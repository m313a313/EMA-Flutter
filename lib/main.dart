import 'package:ema/cubit/place_cubit/place_cubit.dart';
import 'package:ema/cubit/theme_cubit/theme_cubit.dart';
import 'package:ema/cubit/theme_cubit/theme_state.dart';
import 'package:ema/pages/google_map_page.dart';
import 'package:ema/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ema/cubit/auht_cubit/auth_cubit.dart';
import 'package:ema/pages/home_page.dart';
import 'package:ema/shared/network/local_network.dart';
import 'package:ema/theme/theme.dart';

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
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => PlaceCubit())
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(        
          builder: (context, state) {
            return MaterialApp(
              theme: darkMode ? darktMode : lightMode,
              darkTheme: darktMode,
              home: HomePage(),
            );
          },
        ));
  }
}
