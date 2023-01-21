import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:veux_camion/Features/Main_Home/view/home_screen.dart';

import '../../../AppUrl/appurl.dart';

class OtpPage extends StatefulWidget {
  final String email;

  OtpPage({required this.email});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController codeController = TextEditingController();
  bool issave = false;

  Future otpconfirm(String otp) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest(
      'POST',
      Uri.parse(AppUrl.otp),
    );
    request.fields.addAll({
      'otp': otp,
      'email': widget.email.toString(),
    });

    request.headers.addAll(requestHeaders);

    request.send().then((result) async {
      http.Response.fromStream(result).then((response) {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          print('response.body ' + data.toString());

          saveprefs(
            data['data']['token'],
            data['data']['user']['phone'],
            data['data']['user']['username'],
            data['data']['user']['email'],
          );

          if (data['status_code'] == 200) {
            Fluttertoast.showToast(
                msg: "Registered Successfully",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreenPage()));
          } else {
            Fluttertoast.showToast(
                msg: "OTP Not Macth",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            print(response.body);
          }
        } else {
          print(response.body);
          print(widget.email);

          return response.body;
        }
      });
    });
  }

  saveprefs(
    String token,
    String phone,
    String name,
    String email,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    prefs.setString('phone', phone);
    prefs.setString('name', name);
    prefs.setString('email', email);
    setState(() {
      issave = true;
    });
    if (issave == true) {
      getdata();
    }
  }

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var user = prefs.getString('user_name');
    var fname = prefs.getString('first_name');
    var lname = prefs.getString('last_name');
    var email = prefs.getString('email');
    var phone = prefs.getString('phone');
    print('Token ' + token!);
    print('fname= ' + fname!);
    print('lname ' + lname!);
    print('email ' + email!);
    print('phoneno ' + phone!);
    print('user ' + user!);
  }

  // ignore: unused_element
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    // ignore: deprecated_member_use
  }

  // ignore: unused_field
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    codeController.clear();
    print(widget.email);
  }

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
            msg: "Can't go back at this stage!!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      },
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
            "Authentication",
            style: TextStyle(
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Center(
                    child: Image(
                      image: AssetImage('images/authentication.png'),
                      height: 191,
                      width: 164,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: 55,
                //       width: 55,
                //       // padding: EdgeInsets.all(10),
                //       child: TextFormField(
                //         controller: codeController,
                //         // onChanged: (value) {
                //         //   if (value.length == 1) {
                //         //     FocusScope.of(context).nextFocus();
                //         //   }
                //         // },
                //         inputFormatters: [
                //           LengthLimitingTextInputFormatter(1),
                //           FilteringTextInputFormatter.digitsOnly
                //         ],
                //         keyboardType: TextInputType.number,
                //         style: Theme.of(context).textTheme.headline6,
                //         validator: (value) {
                //           if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                //             return "Please provide a valid OTP";
                //           }
                //           return null;
                //         },
                //         textAlign: TextAlign.center,
                //         decoration: InputDecoration(
                //           filled: true,
                //           fillColor: Color(0xff94D8FF),
                //           border: OutlineInputBorder(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(30))),
                //           labelText: '',
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 55,
                //       width: 55,
                //       // padding: EdgeInsets.all(10),
                //       child: TextFormField(
                //         controller: codeController,
                //         // onChanged: (value) {
                //         //   if (value.length == 1) {
                //         //     FocusScope.of(context).nextFocus();
                //         //   }
                //         // },
                //         inputFormatters: [
                //           LengthLimitingTextInputFormatter(1),
                //           FilteringTextInputFormatter.digitsOnly
                //         ],
                //         validator: (value) {
                //           if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                //             return "Please provide a valid OTP";
                //           }
                //           return null;
                //         },
                //         keyboardType: TextInputType.number,
                //         style: Theme.of(context).textTheme.headline6,
                //         textAlign: TextAlign.center,
                //         decoration: InputDecoration(
                //           filled: true,
                //           fillColor: Color(0xff94D8FF),
                //           border: OutlineInputBorder(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(30))),
                //           labelText: '',
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 55,
                //       width: 55,
                //       // padding: EdgeInsets.all(10),
                //       child: TextFormField(
                //         controller: codeController,
                //         // onChanged: (value) {
                //         //   if (value.length == 1) {
                //         //     FocusScope.of(context).nextFocus();
                //         //   }
                //         // },
                //         inputFormatters: [
                //           LengthLimitingTextInputFormatter(1),
                //           FilteringTextInputFormatter.digitsOnly
                //         ],
                //         validator: (value) {
                //           if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                //             return "Please provide a valid OTP";
                //           }
                //           return null;
                //         },
                //         keyboardType: TextInputType.number,
                //         style: Theme.of(context).textTheme.headline6,
                //         textAlign: TextAlign.center,
                //         decoration: InputDecoration(
                //           filled: true,
                //           fillColor: Color(0xff94D8FF),
                //           border: OutlineInputBorder(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(30))),
                //           labelText: '',
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 55,
                //       width: 55,
                //       // padding: EdgeInsets.all(10),
                //       child: TextFormField(
                //         controller: codeController,
                //         onChanged: (value) {
                //           if (value.length == 1) {
                //             FocusScope.of(context).nextFocus();
                //           }
                //         },
                //         inputFormatters: [
                //           LengthLimitingTextInputFormatter(1),
                //           FilteringTextInputFormatter.digitsOnly
                //         ],
                //         validator: (value) {
                //           if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                //             return "Please provide a valid OTP";
                //           }
                //           return null;
                //         },
                //         keyboardType: TextInputType.number,
                //         style: Theme.of(context).textTheme.headline6,
                //         textAlign: TextAlign.center,
                //         decoration: InputDecoration(
                //           filled: true,
                //           fillColor: Color(0xff94D8FF),
                //           border: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.blue),
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(30))),
                //           labelText: '',
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Check your email for OTP!",
                    style: TextStyle(
                        fontFamily: GoogleFonts.workSans().fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive code? ",
                      style: TextStyle(
                          fontFamily: GoogleFonts.workSans().fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend ",
                        style: TextStyle(
                            fontFamily: GoogleFonts.workSans().fontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: codeController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Enter Code",
                          hintStyle: TextStyle(
                              fontSize: 19,
                              color: Colors.black.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0)),
                      validator: (value) {
                        if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                          return "Please provide a valid OTP";
                        }
                        return null;
                      },
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      otpconfirm(
                        codeController.text,
                      );
                    } else {}
                    print(widget.email);
                  },
                  child: Container(
                    width: 274,
                    height: 59,
                    decoration: BoxDecoration(
                        color: Color(0xff31B2FB),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Verify ",
                        style: TextStyle(
                            fontFamily: GoogleFonts.workSans().fontFamily,
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
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
