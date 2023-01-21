import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'done_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController cvcNameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipController = TextEditingController();

  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Payment",
            style: TextStyle(
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.030,
                ),
                Text(
                  "Add your payment information",
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Text(
                  "Card Information",
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Center(
                  child: Container(
                    height: size.height * 0.075,
                    width: size.width * 0.80,
                    child: TextField(
                      controller: cardNumberController,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Color(0xffE8E8E8),
                        labelText: "Card Number",
                        labelStyle: TextStyle(color: Color(0xffC4C4C4)),
                        suffixIcon: Image(
                          image: AssetImage("images/credit-card 1.png"),
                          // color: Color(0xffC4C4C4),
                          height: 30,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.075,
                      width: size.width * 0.38,
                      child: TextField(
                        controller: dateController,
                        cursorColor: Colors.redAccent,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Color(0xffE8E8E8),
                          labelText: "MM/YY",
                          labelStyle: TextStyle(color: Color(0xffC4C4C4)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.010,
                    ),
                    Container(
                      height: size.height * 0.075,
                      width: size.width * 0.38,
                      child: TextField(
                        controller: cvcNameController,
                        cursorColor: Colors.redAccent,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Color(0xffE8E8E8),
                          labelText: "CVC",
                          labelStyle: TextStyle(color: Color(0xffC4C4C4)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.040,
                ),
                Text(
                  "Country or region",
                  style: TextStyle(
                      fontFamily: GoogleFonts.workSans().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                Center(
                  child: Container(
                    height: size.height * 0.075,
                    width: size.width * 0.80,
                    child: TextField(
                      controller: countryController,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Color(0xffE8E8E8),
                        labelText: "Country",
                        labelStyle: TextStyle(color: Color(0xffC4C4C4)),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                Center(
                  child: Container(
                    height: size.height * 0.075,
                    width: size.width * 0.80,
                    child: TextField(
                      controller: countryController,
                      cursorColor: Colors.redAccent,
                      decoration: InputDecoration(
                        suffix: Image(
                          image: AssetImage("images/credit-card 1.png"),
                          color: Colors.white,
                          height: 30,
                          width: 30,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Color(0xffE8E8E8),
                        labelText: "Zip",
                        labelStyle: TextStyle(color: Color(0xffC4C4C4)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.040,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isClick,
                        onChanged: (bool) {
                          setState(() {
                            isClick = bool!;
                          });
                        }),
                    Text(
                      "Save this card for future payment",
                      style: TextStyle(
                          fontFamily: GoogleFonts.workSans().fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 0.1),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.060,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => DoneScreen()),
                        ModalRoute.withName("/DoneScreen"));
                  },
                  child: Center(
                    child: Container(
                      height: size.height * 0.075,
                      width: size.width * 0.80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff226DFF)),
                      child: Center(
                        child: Text(
                          "Pay \$ 450.00",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
