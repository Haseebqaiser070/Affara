import 'package:afara/constants/constants.dart';
import 'package:afara/views/calendarset.dart';
import 'package:afara/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _value = 1;
  String? selectedLanguage;

  List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/Image.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Hello Toyos!",
                          size: 12.0.sp,
                          color: textcol,
                          weight: FontWeight.w400,
                          align: TextAlign.left,
                        ),
                        SizedBox(height: 0.5.h),
                        TextWidget(
                          text: "Continue with Yoruba!",
                          size: 14.0.sp,
                          color: textcol,
                          weight: FontWeight.w500,
                          align: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: whitecol,
                            borderRadius: BorderRadius.circular(200)),
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Icon(Icons.notifications_sharp),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFormField(
                cursorColor: textcol,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: whitecol,
                    prefixIcon: Icon(
                      Icons.search,
                      color: textcol,
                    ),
                    hintText: "Search..."),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffCC9A7B),
                    borderRadius: BorderRadius.circular(13)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "What do you want to \nlearn today?",
                                size: 14.0.sp,
                                color: Colors.black,
                                weight: FontWeight.w500,
                                align: TextAlign.left,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.26,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 2.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextWidget(
                                            text: "Start",
                                            size: 12.0.sp,
                                            color: Colors.black,
                                            weight: FontWeight.w500,
                                            align: TextAlign.left,
                                          ),
                                        ),
                                        Expanded(
                                            child:
                                                Icon(Icons.arrow_circle_right))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Image(image: AssetImage("assets/Image_2.png")))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(
                    10,
                    (int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          padding: EdgeInsets.all(10),
                          visualDensity: VisualDensity.compact,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          selectedColor: kselectcolor,
                          backgroundColor: kScaffoldBg,
                          labelStyle: GoogleFonts.inter(
                            color: _value == index ? Colors.white : textcol,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          label: Text('Day ${index + 1}'),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                            });
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Divider(
                color: kselectcolor,
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextWidget(
                      text: "All Lessons",
                      size: 14.0.sp,
                      color: textcol,
                      weight: FontWeight.w600,
                      align: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select Language',
                        labelStyle: GoogleFonts.inter(
                          color: textcol,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: whitecol,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.2, horizontal: 1.5.h),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      value: selectedLanguage,
                      items: languages.map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLanguage = newValue;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalenderSetScreen(),
                    ),
                  );
                },
                child: LessonCard(
                    title: "Reading", date: "May 16, 2022", percent: "60"),
              ),
              SizedBox(
                height: 2.h,
              ),
              LessonCard(title: "Music", date: "May 16, 2022", percent: "49"),
              SizedBox(
                height: 2.h,
              ),
              LessonCard(title: "Speak", date: "May 16, 2022", percent: "88"),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  LessonCard({required this.title, required this.date, required this.percent});

  final title;
  final date;
  final percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image(
              image: AssetImage("assets/Image.png"),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  size: 14.0.sp,
                  color: textcol,
                  weight: FontWeight.w500,
                  align: TextAlign.left,
                ),
                TextWidget(
                  text: date,
                  size: 11.0.sp,
                  color: textcol,
                  weight: FontWeight.w400,
                  align: TextAlign.left,
                )
              ],
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 7.0,
              percent: (double.parse(percent) / 100.0),
              center: new Text(percent),
              progressColor: int.parse(percent) >= 70
                  ? Colors.green
                  : int.parse(percent) >= 50
                      ? Colors.yellow
                      : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
