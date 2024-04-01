import 'package:afara/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key, required this.videoController}) : super(key: key);

  var videoController;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool showPlaceholder = true;

  @override
  void initState() {
    super.initState();

    videoPlayerController =
        VideoPlayerController.asset("assets/afara_lesson1.mp4");
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      cupertinoProgressColors: ChewieProgressColors(
        playedColor: Color(0xffD5B78D),
        handleColor: Color(0xffD5B78D),
        backgroundColor: Colors.grey,
        bufferedColor: Colors.black12,
      ),
      materialProgressColors: ChewieProgressColors(
        playedColor: Color(0xffD5B78D),
        handleColor: Color(0xffD5B78D),
        backgroundColor: Colors.grey,
        bufferedColor: Colors.black45,
      ),
    );

    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        widget.videoController.animateToPage(
            widget.videoController.page.toInt() + 1,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn);
        // setState(() {
        //   showPlaceholder = false;
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Chewie(
                  controller: chewieController,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Are you sure you want to end the lesson?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: whitecol,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Icon(
                            Icons.cancel,
                          )),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: 5,
                          decoration: BoxDecoration(color: kselectcolor)),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: 5,
                          decoration: BoxDecoration(color: kunselectcolor)),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: 5,
                          decoration: BoxDecoration(color: kunselectcolor)),
                      Container(
                        decoration: BoxDecoration(
                          color: whitecol,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(
                            child: Icon(
                          Icons.upload_outlined,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }
}
