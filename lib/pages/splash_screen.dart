import 'package:flutter/material.dart';
import 'package:ema/pages/home_page.dart';
import 'package:ema/pages/signup_page.dart';
import 'package:ema/shared/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      return Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return userId ==null  ? SignupPage() : HomePage();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'images/logo.png',
                width: 150,
                height: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: const Text(
              'Developed By Mohammed AL-Shateri',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
