import 'package:afara/constants/constants.dart';
import 'package:afara/views/mainslider.dart';
import 'package:afara/views/video_page.dart';
import 'package:afara/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderSetScreen extends StatefulWidget {
  const CalenderSetScreen({super.key});

  @override
  State<CalenderSetScreen> createState() => _CalenderSetScreenState();
}

class _CalenderSetScreenState extends State<CalenderSetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: whitecol,
                ),
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: Center(child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xffEFD9D7),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
                child: TextWidget(
                  text: "One bad day doesn't make failure",
                  size: 16.0.sp,
                  color: textcol,
                  weight: FontWeight.w500,
                  align: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            CalenderSet(),
            SizedBox(
              height: 3.h,
            ),
            Center(
                child: Text(
              'Your Streak count is 10',
              style: TextStyle(
                fontSize: 18,
              ),
            )),
            SizedBox(
              height: 3.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SlideScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color(0xffE7F1D4),
                          padding: EdgeInsets.all(3),
                          child: Image(
                            image: AssetImage("assets/Image_3@3x.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Reading",
                              size: 14.0.sp,
                              color: textcol,
                              weight: FontWeight.w500,
                              align: TextAlign.left,
                            ),
                            TextWidget(
                              text: "May 16, 2022, 6:00 PM - 6:45 PM  ",
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
                      Expanded(child: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalenderSet extends StatefulWidget {
  @override
  _CalenderSetState createState() => _CalenderSetState();
}

class _CalenderSetState extends State<CalenderSet> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        calendarStyle: CalendarStyle(
            markerSizeScale: 50,
            weekendTextStyle: GoogleFonts.inter(color: textcol),
            selectedTextStyle: GoogleFonts.poppins(
              color: Color(0xffffffff),
            ),
            selectedDecoration:
                BoxDecoration(color: kselectcolor, shape: BoxShape.circle),
            defaultTextStyle: GoogleFonts.inter(color: textcol)),
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: GoogleFonts.inter(color: textcol),
            weekendStyle: GoogleFonts.inter(color: textcol)),
        locale: "en_us",
        rowHeight: 5.5.h,
        headerStyle: HeaderStyle(
          leftChevronIcon: Icon(
            Icons.arrow_back_ios,
            color: kselectcolor,
            size: 15,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios,
            color: kselectcolor,
            size: 15,
          ),
          titleTextStyle: GoogleFonts.inter(color: textcol),
          formatButtonVisible: false,
          titleCentered: true,
        ),
        availableGestures: AvailableGestures.all,
        selectedDayPredicate: (day) => isSameDay(day, today),
        focusedDay: today,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        onDaySelected: _onDaySelected,
      ),
    );
  }
}
