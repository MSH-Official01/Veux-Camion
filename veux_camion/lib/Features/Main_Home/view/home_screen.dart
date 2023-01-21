import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Profile/view/profile.dart';
import '../../calendar/view/location_screen.dart';
import '../../calendar/view/second_datetime_picker.dart';
import '../../calendar/view/second_location_screen.dart';
import 'available_view.dart';

final List<String> imgList = [
  'https://wallpaperaccess.com/full/5435920.jpg',
  'https://c4.wallpaperflare.com/wallpaper/61/259/616/sand-volvo-excavator-truck-the-ground-hd-wallpaper-preview.jpg',
  'https://img.freepik.com/free-vector/different-types-construction-trucks_1308-53954.jpg?w=2000',
];

List truckList = [
  {
    'name': 'Mercedes',
    'details': 'GLE AMG 2.0 Hybrid',
    'rating': "4.4 Rating",
    'price': "125 per day",
    'Image':
        "https://w0.peakpx.com/wallpaper/67/837/HD-wallpaper-mercedes-benz-shovel-truck-shovel-benz-truck-mercedes.jpg"
  },
  {
    'name': 'Lexus',
    'details': 'LC 500 5.0 V8 Petrol',
    'rating': "4.8 Rating",
    'price': "330 per day",
    'Image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2GJDc7XNchV7VMPT9oTKSd04zoO2faTxV0A&usqp=CAU"
  },
  {
    'name': 'TATA',
    'details': 'Contintental GTC 5.0 V8 Petrol',
    'rating': "5.0 Rating",
    'price': "430 per day",
    'Image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThXkwdtFPmSQ4UaFPzVlHaKJzUZVyl-sXN4vGQzJconXQ_SN2HJg-c7v6vyRnPdR11c9M&usqp=CAU"
  },
  {
    'name': 'Mitsubishi',
    'details': 'M2 CS 3.0 Petrol',
    'rating': "4.7 Rating",
    'price': "320 per day",
    'Image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDgE3Qs9uUKTGO6cyTo8Ev48iEr61WlUGT5Q&usqp=CAU"
  },
];

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  bool _searchBoolean = false;
  List<int> _searchIndexList = [];
  List<String> _list = [
    'English Textbook',
    'Japanese Textbook',
    'English Vocabulary',
    'Japanese Vocabulary'
  ];

  @override
  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        // setState(() {
        //   _searchIndexList = [];
        //   for (int i = 0; i < _list.length; i++) {
        //     if (_list[i].contains(s)) {
        //       _searchIndexList.add(i);
        //     }
        //   }
        // });
      },
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _searchListView() {
    return ListView.builder(
        itemCount: _searchIndexList.length,
        itemBuilder: (context, index) {
          index = _searchIndexList[index];
          return Card(child: ListTile(title: Text(_list[index])));
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          // shape: OutlineInputBorder(
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(30),
          //         bottomRight: Radius.circular(30))),
          leading: InkWell(
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 2),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                backgroundImage: AssetImage("images/Avatar.png"),
              ),
            ),
          ),
          title: !_searchBoolean
              ? Text(
                  "Hi, " + "Alexandra",
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              : _searchTextField(),

          actions: !_searchBoolean
              ? [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        Future.delayed(const Duration(microseconds: 500),
                            () async {
                          _searchBoolean = true;
                        });

                        // _searchIndexList = [];
                      });
                    },
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                ]
              : [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black54, //<-- SEE HERE
                    child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Color(0xffFFFFFF),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = false;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  itemCount: imgList.length,
                  options: CarouselOptions(
                    // enableInfiniteScroll: true,
                    // autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    initialPage: 0,
                    // autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlay: true,
                    aspectRatio: 16 / 10,
                    // autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1.0,
                  ),
                  itemBuilder: (context, index, realIdx) {
                    return Container(
                      // height: size.height * 0.50,
                      // width: size.width,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(imgList[index].toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // SizedBox(
                //   height: size.height * 0.10,
                // ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: size.width * 80,
                    height: size.height * 0.20,
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SecondLocationScreen()));
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xffE5E5E5)),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.007,
                                              ),
                                              Text(
                                                "Choose Location",
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.workSans()
                                                            .fontFamily,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                width: size.width * 0.030,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SecondDateTimeScreen()));
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xffD8D8D8)),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.007,
                                              ),
                                              Text(
                                                "Choose Date/Time",
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.workSans()
                                                            .fontFamily,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                        SizedBox(
                          height: size.height * 0.010,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(
                                "     Start your  \n experience here",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.workSans().fontFamily,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffF3FEFA)),
                              ),
                              SizedBox(
                                width: size.width * 0.15,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewAllPage()));
                                  });
                                },
                                child: Container(
                                  width: size.width * .35,
                                  height: size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffF3B33D)),
                                  child: Center(
                                    child: Text(
                                      "Check Availability",
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.workSans().fontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xffF3FEFA)),
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
                  height: size.height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Container(
                        width: size.width * .40,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xffffffff)),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontFamily: GoogleFonts.workSans().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Container(
                        width: size.width * .40,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xffffffff)),
                        child: Center(
                          child: Text(
                            "Popular",
                            style: TextStyle(
                                fontFamily: GoogleFonts.workSans().fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                        fontFamily: GoogleFonts.workSans().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff676767)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),

                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: size.width * 80,
                    height: size.width * 0.30,
                    decoration: BoxDecoration(
                        color: Color(0xff00A3FF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height * 0.15,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image(
                                    image: AssetImage("images/pngwing 3.png")),
                              ),
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.010,
                                  ),
                                  Text(
                                    "Maserati",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.workSans().fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffF3FEFA)),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    "Ghibli 3.0 V6 Diesel",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.workSans().fontFamily,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xffF3FEFA)),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "4.4" + " Rating",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.workSans()
                                                .fontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xffF3FEFA)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height * 0.80,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                    color: Color(0xffF3B33D),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_right_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),

                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: size.width * 80,
                    height: size.width * 0.30,
                    decoration: BoxDecoration(
                        color: Color(0xff226DFF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height * 0.15,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Image(
                                  image: AssetImage("images/jaguar 1.png"),
                                  // height: 50,
                                  // width: 50,
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.010,
                                  ),
                                  Text(
                                    "Jaguar",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.workSans().fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffF3FEFA)),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.005,
                                  ),
                                  Text(
                                    "F-Pace SE 3.0 Hybrid ",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.workSans().fontFamily,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xffF3FEFA)),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "4.4" + " Rating",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.workSans()
                                                .fontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xffF3FEFA)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height * 0.80,
                                width: size.width * 0.27,
                                decoration: BoxDecoration(
                                    color: Color(0xffF3B33D),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_right_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Available",
                    style: TextStyle(
                        fontFamily: GoogleFonts.workSans().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff676767)),
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
                                                fontFamily:
                                                    GoogleFonts.workSans()
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
                                                fontFamily:
                                                    GoogleFonts.workSans()
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                image: AssetImage(
                                                    "images/uro.png"),
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
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                              image: NetworkImage(
                                                  truckList[index]['Image']
                                                      .toString())),
                                        ),
                                      ))
                                ],
                              ),
                            )),
                      );
                    }),

                SizedBox(
                  height: size.height * 0.020,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllPage()));
                    });
                  },
                  child: Center(
                      child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * .50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "View all ",
                          style: TextStyle(
                              fontFamily: GoogleFonts.workSans().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff00A3FF)),
                        ),
                      ),
                    ),
                  )),
                ),
                SizedBox(
                  height: size.height * 0.050,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
