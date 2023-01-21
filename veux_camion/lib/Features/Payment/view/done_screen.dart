
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:veux_camion/Features/Main_Home/view/home_screen.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          // leading: 
          //     Icon(Icons.arrow_back_ios),
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
        body: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(
                  flex: 7,
                  child: Container(
                    height: size.height * 0.50,
                    width: size.width * 0.90,
                    // color: Colors.orange,
                    child: Lottie.asset("images/done.json",
                        repeat: false,
                        height: size.height * 0.08,
                        width: size.width * 0.08,
                        fit: BoxFit.contain),
                  )),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreenPage()),
                        ModalRoute.withName("/DoneScreen"));
                  },
                  child: Center(
                    child: Container(
                      height: size.height * 0.075,
                      width: size.width * 0.60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff226DFF)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "View Account",
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(width: size.width * 0.030),
                            Image(
                              image: AssetImage("images/Vector 7.png"),
                              color: Colors.white,
                              height: 25,
                              width: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
