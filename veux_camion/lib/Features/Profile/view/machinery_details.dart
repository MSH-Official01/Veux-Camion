import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veux_camion/Features/Profile/view/machinary_done.dart';

class MachineryDetails extends StatefulWidget {
  MachineryDetails({super.key});

  TextEditingController commentControllar = TextEditingController();

  @override
  State<MachineryDetails> createState() => _MachineryDetailsState();
}

class _MachineryDetailsState extends State<MachineryDetails> {
  final TextEditingController machineryNumberController =
      TextEditingController();

  final TextEditingController machineryCapacityController =
      TextEditingController();

  final TextEditingController machineryServiceTimeController =
      TextEditingController();

  final TextEditingController machineryModelController =
      TextEditingController();

  final TextEditingController perDayRentController = TextEditingController();

  final TextEditingController machineryLocationController =
      TextEditingController();

  XFile? _chooseImage;
  String? _imageUrl;

  chooseImageFromGC() async {
    ImagePicker _picker = ImagePicker();
    // _courseImage = await _picker.pickImage(source: ImageSource.camera);
    _chooseImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00A3FF),
        toolbarHeight: 70,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "Machinery Details",
          style: TextStyle(
              fontFamily: GoogleFonts.workSans().fontFamily,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.020,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            chooseImageFromGC();
                          });
                        },
                        child: Container(
                            height: size.height * 0.5,
                            child: _chooseImage == null
                                ? Image(image: AssetImage("images/image 1.png"))
                                : Image.file(File(_chooseImage!.path))),
                      ),
                      SizedBox(
                        width: size.width * 0.050,
                      ),
                      Text(
                        "Upload Image",
                        style: const TextStyle(
                            color: Color(0xff004369),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 2,
                  color: Color(0xff0087D3),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                  controller: machineryNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    labelText: 'Machinery Number (EX:x12yds)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  height: 2,
                  color: Color(0xff0087D3),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                  controller: machineryNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    labelText: 'Machinery Capacity (EX: 700KG)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  height: 2,
                  color: Color(0xff0087D3),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                  controller: machineryNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    labelText: 'Machinery Service time (EX: 1 Year)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  height: 2,
                  color: Color(0xff0087D3),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                  controller: machineryNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    labelText: 'Machinery Model (EX: Ford F-Max)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  height: 2,
                  color: Color(0xff0087D3),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                  controller: machineryNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    labelText: 'Per Day Rent (EX: 10\$/ Per day)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  height: 2,
                  color: Color(0xff0087D3),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                  controller: machineryNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF5F5F5),
                    labelText: 'Machinery Location (EX: 176/London)',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  height: 2,
                  color: Color(0xff0087D3),
                ),
              ),
              SizedBox(height: size.height * 0.020),
              TextFormField(
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    fillColor: Color(0xffBFE8FF),
                    hintText: "Machinery Description......",
                    hintStyle: TextStyle(color: Color(0xffAAA4A4)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              SizedBox(height: size.height * 0.020),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MachinaryDoneScreen()));
                  },
                  child: Center(
                      child: Container(
                    height: size.height * 0.070,
                    width: size.width * 0.50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xff30B4FF)),
                    child: Center(
                      child: Text(
                        "Submit For Rent",
                        style: TextStyle(
                            color: Color(0xffFFFFFFFF),
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                    ),
                  ))),
              SizedBox(height: size.height * 0.020),
            ],
          ),
        ),
      ),
    );
  }
}
