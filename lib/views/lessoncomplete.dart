import 'package:afara/constants/constants.dart';
import 'package:afara/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

class LessonCompleteScreen extends StatelessWidget {
  const LessonCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Image(
                    image: AssetImage("assets/Image_7.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextWidget(
                text: "Lesson Complete",
                size: 25.0.sp,
                color: textcol,
                weight: FontWeight.w400,
                align: TextAlign.center,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
            child: Container(
              child: Row(
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
                      decoration: BoxDecoration(color: kselectcolor)),
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
}
