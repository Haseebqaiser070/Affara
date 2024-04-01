import 'package:afara/constants/constants.dart';
import 'package:afara/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LessonPageScreen extends StatefulWidget {
  const LessonPageScreen({Key? key}) : super(key: key);

  @override
  State<LessonPageScreen> createState() => _LessonPageScreenState();
}

class _LessonPageScreenState extends State<LessonPageScreen> {
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    speakText("Ekaaro");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: whitecol,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.volume_up,
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                TextWidget(
                  text: "Ekaaro",
                  size: 18.0.sp,
                  color: textcol,
                  weight: FontWeight.w600,
                  align: TextAlign.left,
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: Divider(),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            TextWidget(
              text: "Good Morning",
              size: 15.0.sp,
              color: Color(0xff819089),
              weight: FontWeight.w400,
              align: TextAlign.left,
            ),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                child: Row(
                  children: [
                    Expanded(
                        child: Cards(
                            text1: "1m",
                            text2: "Again",
                            color: Color(0xffD5B78D))),
                    SizedBox(width: 3.w),
                    Expanded(
                        child: Cards(
                            text1: "6m",
                            text2: "Hard",
                            color: Color(0xff939876))),
                    SizedBox(width: 3.w),
                    Expanded(
                        child: Cards(
                            text1: "10m",
                            text2: "Good",
                            color: Color(0xffA29786))),
                    SizedBox(width: 3.w),
                    Expanded(
                        child: Cards(
                            text1: "4d",
                            text2: "Easy",
                            color: Color(0xff7E95A1))),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: 50,
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
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: 5,
                      decoration: BoxDecoration(color: kselectcolor)),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: 5,
                      decoration: BoxDecoration(color: kselectcolor)),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: 5,
                      decoration: BoxDecoration(color: kunselectcolor)),
                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> speakText(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(text);
  }
}

class Cards extends StatelessWidget {
  const Cards({required this.text1, required this.text2, required this.color});
  final text1;
  final text2;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
      child: Column(
        children: [
          TextWidget(
            text: text1,
            size: 12.0.sp,
            color: Color(0xff302939),
            weight: FontWeight.w500,
            align: TextAlign.left,
          ),
          TextWidget(
            text: text2,
            size: 13.0.sp,
            color: Color(0xff302939),
            weight: FontWeight.w500,
            align: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
