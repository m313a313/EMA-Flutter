// import 'package:ema/pages/complaints_page.dart';
import 'package:ema/pages/dd.dart';
import 'package:ema/pages/google_map_page.dart';
import 'package:ema/pages/nearby_places.dart';
import 'package:ema/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List _pages = [
    const GoogleMapPage(),
    DropDownHelper(),
    const NearbyPlaces(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

  BottomNavigationBar customBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        // unselectedItemColor: Colors.black38,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.room), label: 'Rome'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Nearby places'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]);
  }
}
