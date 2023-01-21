import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Summary/view/summary_screen.dart';

class DateTimeScreen extends StatefulWidget {
  DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
 
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF1F1F1)),
                    child: Center(
                        child: Image(image: AssetImage("images/Vector 2.png"))),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Choose Date & Time",
                style: TextStyle(
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    color: Color(0xff414141),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "From",
                      style: TextStyle(
                          fontFamily: GoogleFonts.workSans().fontFamily,
                          color: Color(0xff414141),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    SizedBox(
                      width: size.width * .50,
                    ),
                    Text(
                      "Until",
                      style: TextStyle(
                          fontFamily: GoogleFonts.workSans().fontFamily,
                          color: Color(0xff414141),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * 0.090,
                    width: size.width * 0.40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xffF1F1F1)),
                    child: Center(
                      child: Text(
                        today.toString().split(" ")[0],
                        style: TextStyle(
                            color: Color(0xff00A3FF),
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.090,
                    width: size.width * 0.40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xffF1F1F1)),
                    child: Center(
                      child: Text(
                        "31/01/2029",
                        style: TextStyle(
                            color: Color(0xff00A3FF),
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.0005),
              TableCalendar(
                locale: "en_US",
                rowHeight: 50,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: ((day) => isSameDay(day, today)),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 12, 31),
                lastDay: DateTime.utc(2100, 12, 31),
                onDaySelected: _onDaySelected,
              ),
              SizedBox(height: size.height * 0.030),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Time",
                  style: TextStyle(
                      color: Color(0xff414141),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: size.height * 0.030),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * 0.070,
                    width: size.width * 0.40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xffF1F1F1)),
                    child: Center(
                      child: Text(
                        " 12:00PM",
                        style: TextStyle(
                            color: Color(0xff00A3FF),
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                    setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SummaryScreen()));
                    });
                    },
                    child: Container(
                      height: size.height * 0.070,
                      width: size.width * 0.40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff226DFF)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Confirm",
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: size.width * 0.020,
                            ),
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
