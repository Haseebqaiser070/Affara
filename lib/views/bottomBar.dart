import 'package:afara/constants/constants.dart';
import 'package:afara/views/home.dart';
import 'package:afara/views/profile.dart';
import 'package:afara/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomNavigationHolder extends StatefulWidget {
  const BottomNavigationHolder({super.key});

  @override
  State<BottomNavigationHolder> createState() => _BottomNavigationHolderState();
}

class _BottomNavigationHolderState extends State<BottomNavigationHolder> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      HomeScreen(),
      ProfileScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 3.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: kselectcolor,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 25,
                ),
                label: 'Settings',
              ),
            ],
            currentIndex: selectedIndex,
            unselectedItemColor: Color(0xffB39D87),
            selectedItemColor: whitecol,
            selectedIconTheme: IconThemeData(color: whitecol),
            onTap: onItemTapped,
          ),
        ),
      ),
    );
  }
}
