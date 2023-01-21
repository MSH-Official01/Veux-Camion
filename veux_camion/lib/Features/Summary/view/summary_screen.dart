import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veux_camion/Features/Payment/view/payment_screen.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
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
              SizedBox(
                height: size.height * 0.050,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Summary",
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      color: Color(0xff414141),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Container(
                  // color: Colors.orange,
                  height: size.height * 0.20,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: double.maxFinite,
                              width: size.width * 0.020,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xffE5E5E5)),
                              child:
                                  Image(image: AssetImage("images/icon10.png")),
                            ),
                          )),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Text(
                              "Mitsubishi",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.workSans().fontFamily,
                                  color: Color(0xff676767),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: size.height * 0.018,
                            ),
                            Text(
                              "Ghibli 3.0 V6 Diesel - Auto RWD 48 mpg",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.workSans().fontFamily,
                                  color: Color(0xff676767),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            SizedBox(
                              height: size.height * 0.013,
                            ),
                            Row(
                              children: [
                                Image(image: AssetImage("images/location.png")),
                                SizedBox(
                                  width: size.width * 0.010,
                                ),
                                Text(
                                  "London - Heathrow ",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.workSans().fontFamily,
                                      color: Color(0xff676767),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.013,
                            ),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage("images/Vector1.png"),
                                  color: Color(0xff676767),
                                ),
                                SizedBox(
                                  width: size.width * 0.010,
                                ),
                                Text(
                                  "30/01/2029 - 08:00pm",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.workSans().fontFamily,
                                      color: Color(0xff676767),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xffE5E5E5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 5),
                child: Container(
                  height: size.height * 0.20,
                  width: size.width * 0.90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffE7E9EB)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Maserati Ghibli",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.workSans().fontFamily,
                                      color: Color(0xff414141),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: size.height * 0.030,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "3 Days",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.workSans()
                                                .fontFamily,
                                            color: Color(0xff414141),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "£750",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.workSans()
                                                .fontFamily,
                                            color: Color(0xff414141),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.020,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Extra Driver Insurance",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.workSans()
                                                .fontFamily,
                                            color: Color(0xff414141),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "£100",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.workSans()
                                                .fontFamily,
                                            color: Color(0xff414141),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.010,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Color(0xffC4C4C4),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.010,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Price",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.workSans()
                                                .fontFamily,
                                            color: Color(0xff414141),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "£850",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.workSans()
                                                .fontFamily,
                                            color: Color(0xff414141),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.09,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                     setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SummaryScreen()));
                     });
                    },
                    child: Card(
                      child: Container(
                        height: size.height * 0.080,
                        width: size.width * 0.40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFFFFFF)),
                        child: Center(
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                color: Color(0xff00A3FF),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.040,
                  ),
                  InkWell(
                    onTap: () {
                setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen()));
                });
                    },
                    child: Container(
                      height: size.height * 0.080,
                      width: size.width * 0.40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffF3B33D)),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
