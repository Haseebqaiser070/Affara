import 'package:afara/constants/constants.dart';
import 'package:afara/views/bottomBar.dart';
import 'package:afara/views/calendarset.dart';
import 'package:afara/views/home.dart';
import 'package:afara/views/lessoncomplete.dart';
import 'package:afara/views/lessonpage.dart';
import 'package:afara/views/video_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Afara',
          theme: ThemeData(
            scaffoldBackgroundColor: kScaffoldBg,
            primarySwatch: Colors.blue,
          ),
          home: const BottomNavigationHolder());
    });
  }
}
