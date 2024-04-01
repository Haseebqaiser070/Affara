import 'package:afara/views/lessoncomplete.dart';
import 'package:afara/views/lessonpage.dart';
import 'package:afara/views/video_page.dart';
import 'package:flutter/material.dart';

class SlideScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  SlideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            child: VideoScreen(
              videoController: _pageController,
            ),
          ),
          Container(
            child: LessonPageScreen(),
          ),
          Container(
            child: LessonCompleteScreen(),
          ),
        ],
      ),
    );
  }
}
