import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Main_Home/view/home_screen.dart';

List locationList = [
  {
    "Name": "London - Kensington",
  },
  {
    "Name": "London - Westfields (Acton)",
  },
  {
    "Name": "London - Park Lane",
  },
  {
    "Name": "London - Canary Wharf",
  },
  {
    "Name": "London - Stanstead Airport",
  },
  {
    "Name": "London - Kings Cross",
  },
  {
    "Name": "London - Gatwick Airport",
  },
];

class SecondLocationScreen extends StatefulWidget {
  const SecondLocationScreen({super.key});

  @override
  State<SecondLocationScreen> createState() => _SecondLocationScreenState();
}

class _SecondLocationScreenState extends State<SecondLocationScreen> {
  TextEditingController searchControllar = TextEditingController();

  bool onClick = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Choose Pick Up Location",
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      color: Color(0xff414141),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: searchControllar,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    focusColor: Color(0xffF9F9F9),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFFFFFF)),
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Search Locations',
                    labelStyle: TextStyle(color: Color(0xffC4C4C4)),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image(image: AssetImage("images/location.png")),
                  ),
                  Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Location",
                            style: TextStyle(
                                fontFamily: GoogleFonts.workSans().fontFamily,
                                color: Color(0xff676767),
                                fontWeight: FontWeight.normal,
                                fontSize: 10),
                          ),
                          Text(
                            "London - Heathrow Airport (T3)",
                            style: TextStyle(
                                fontFamily: GoogleFonts.workSans().fontFamily,
                                color: Color(0xff414141),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: size.height * 0.030,
                          width: size.width * 0.030,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Center(
                            child: Text(
                              "Change",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.workSans().fontFamily,
                                  color: Color(0xff226DFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Popular Locations",
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      color: Color(0xff414141),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: locationList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 5),
                        child: Container(
                          height: size.height * 0.060,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image(
                                      image:
                                          AssetImage("images/location.png"))),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  "${locationList[index]['Name']}",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.workSans().fontFamily,
                                      color: Color(0xff414141),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: onClick == true
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreenPage()));
                                            });
                                          },
                                          child: Container(
                                            height: size.height * 0.040,
                                            width: size.width * 0.010,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xffFFFFFFF)),
                                            child: Center(
                                              child: Text(
                                                "Choose",
                                                style: TextStyle(
                                                    color: Color(0xff226DFF),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreenPage()));
                                            });
                                          },
                                          child: Container(
                                            height: size.height * 0.040,
                                            width: size.width * 0.010,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xff226DFF)),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Choose",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14),
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
                                        )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
