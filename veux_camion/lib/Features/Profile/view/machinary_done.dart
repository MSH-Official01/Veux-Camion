import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:veux_camion/Features/Main_Home/view/home_screen.dart';

class MachinaryDoneScreen extends StatefulWidget {
  const MachinaryDoneScreen({super.key});

  @override
  State<MachinaryDoneScreen> createState() => _MachinaryDoneScreenState();
}

class _MachinaryDoneScreenState extends State<MachinaryDoneScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Container(
              height: size.height * 0.50,
              width: double.infinity,
              child: Image(image: AssetImage("images/done.png")),
            ),
          ),
          Text(
            "Done",
            style: TextStyle(
                color: Color(0xff0E5883),
                fontWeight: FontWeight.bold,
                fontSize: 85),
          ),
          Text(
            "you are good to go",
            style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.bold,
                fontSize: 28),
          ),
          SizedBox(height: size.height * 0.10),
          InkWell(
              onTap: () {
               
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreenPage()),
                    ModalRoute.withName("/MachinaryDoneScreen"));
              },
              child: Center(
                  child: Container(
                height: size.height * 0.090,
                width: size.width * 0.40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xff30B4FF)),
                child: Center(
                  child: Text(
                    "Go",
                    style: TextStyle(
                        color: Color(0xffFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ),
                ),
              ))),
          SizedBox(height: size.height * 0.0005),
        ],
      ),
    );
  }
}
