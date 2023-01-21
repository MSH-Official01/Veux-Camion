import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../calendar/view/location_screen.dart';

List truckList = [
  {
    'name': 'Maserati',
    'details': 'Ghibli 3.0 V6 Diesel',
    'rating': "4.8 Rating",
    'price': "250 per day",
    'Image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDgE3Qs9uUKTGO6cyTo8Ev48iEr61WlUGT5Q&usqp=CAU"
  },
  {
    'name': 'Mercedes',
    'details': 'GLE AMG 2.0 Hybrid',
    'rating': "4.4 Rating",
    'price': "125 per day",
    'Image':
        "https://w0.peakpx.com/wallpaper/67/837/HD-wallpaper-mercedes-benz-shovel-truck-shovel-benz-truck-mercedes.jpg"
  },
  {
    'name': 'Bentley',
    'details': 'Contintental GTC 5.0 V8 Petrol',
    'rating': "5.0 Rating",
    'price': "430 per day",
    'Image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYu2VGH75-Wj0lrIHEc3g910MWEWE0mtETyg&usqp=CAU"
  },
  {
    'name': 'BMW',
    'details': 'M2 CS 3.0 Petrol',
    'rating': "4.7 Rating",
    'price': "320 per day",
    'Image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLUPxOFQ2viSyEAiqZR7HIIEOtj654812ByA&usqp=CAU"
  },
];

class ViewAllPage extends StatefulWidget {
  ViewAllPage({super.key});

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "Available",
          style: TextStyle(
              fontFamily: GoogleFonts.workSans().fontFamily,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: size.width * 70,
                  height: size.height * 0.10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff00A3FF)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             PickUpLocationScreen()));
                                });
                              },
                              child: Container(
                                width: size.width * .40,
                                height: size.height * 0.07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xff226DFF)),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Pick Up Location",
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.workSans()
                                                          .fontFamily,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xffE5E5E5)),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.007,
                                            ),
                                            Text(
                                              "London - Kensington",
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.workSans()
                                                          .fontFamily,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Center(
                                            child: Image(
                                              image: AssetImage(
                                                  "images/Vector.png"),
                                              height: 9,
                                              width: 15,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.055,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             DateTimeScreen()));
                                });
                              },
                              child: Container(
                                width: size.width * .40,
                                height: size.height * 0.07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xff226DFF)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Date & Time",
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.workSans()
                                                          .fontFamily,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xffD8D8D8)),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.007,
                                            ),
                                            Text(
                                              "29/01/2029 - 12PM",
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.workSans()
                                                          .fontFamily,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Center(
                                            child: Image(
                                              image: AssetImage(
                                                  "images/Vector1.png"),
                                              height: 9,
                                              width: 15,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "4 Cars Found",
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff161616)),
                ),
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: truckList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PickUpLocationScreen()));
                        });
                      },
                      child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            height: size.height * .16,
                            width: size.width * .80,
                            decoration: BoxDecoration(
                                color: Color(0xffE5E5E5),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          truckList[index]['name'].toString(),
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.workSans()
                                                  .fontFamily,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff676767)),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.015,
                                        ),
                                        Text(
                                          truckList[index]['details']
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.workSans()
                                                  .fontFamily,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xff676767)),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star_border_outlined,
                                              size: 15,
                                            ),
                                            Text(
                                              truckList[index]['rating']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.workSans()
                                                          .fontFamily,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff676767)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.010,
                                        ),
                                        Row(
                                          children: [
                                            Image(
                                              image:
                                                  AssetImage("images/uro.png"),
                                              height: 13,
                                              width: 9,
                                            ),
                                            SizedBox(
                                              width: size.width * 0.005,
                                            ),
                                            Text(
                                              truckList[index]['price']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.workSans()
                                                          .fontFamily,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff676767)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                        height: size.height * .25,
                                        width: size.width * .99,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Image(
                                            image: NetworkImage(truckList[index]
                                                    ["Image"]
                                                .toString())),
                                      ),
                                    ))
                              ],
                            ),
                          )),
                    );
                  }),
              SizedBox(
                height: size.height * 0.010,
              )
            ],
          ),
        ),
      ),
    );
  }
}
