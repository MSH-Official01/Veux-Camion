import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'package:veux_camion/Features/Main_Home/view/home_screen.dart';
import 'package:veux_camion/Features/auth/view/signup_otp.dart';
import 'package:veux_camion/Features/auth/view/signup_screen.dart';

import '../../../AppUrl/appurl.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email_ = TextEditingController();

  final TextEditingController password_ = TextEditingController();

  var token;
  void isLoogedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print(token);
  }

  final _formKey = GlobalKey<FormState>();
  bool islogin = false;
  bool issave = false;

  Future login(String email, String password) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest(
      'POST',
      Uri.parse(AppUrl.login),
    );
    request.fields.addAll({
      // 'email': email != null ? email : '02222221',
      'email': email,
      'password': password,
    });

    request.headers.addAll(requestHeaders);

    request.send().then((result) async {
      http.Response.fromStream(result).then((response) {
        var data = jsonDecode(response.body);

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          print(data['status_code']);
          print('response.body ' + data.toString());

          // otp verify not macth 404
          // password  macth 200
          // password not macth 400

          if (data['status_code'] == 200) {
            setState(() {
              islogin = false;
            });

            // print(data['token']['plainTextToken']);
            // print(data['data']['username']);
            saveprefs(
              data['data']['token'],
              data['data']['user']['phone'],
              data['data']['user']['username'],
              data['data']['user']['email'],
            );
            print("Success! ");
            Fluttertoast.showToast(
                msg: "Login Successfully",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black54,
                textColor: Colors.black,
                fontSize: 16.0);

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreenPage()));
          }
        } else if (data['status_code'] == 404) {
          setState(() {
            islogin = false;
          });
          print("Fail! ======= 404 OTP NOT FOUND");
          var data = jsonDecode(response.body);
          print(data);

          Fluttertoast.showToast(
              msg: "Verify your OTP first",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.black,
              fontSize: 16.0);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpPage(
                        email: email,
                      )),
              ModalRoute.withName("/DoneScreen"));
        } else {
          setState(() {
            islogin = false;
          });
          print("Fail! ======== Unauthorized ");
          var data = jsonDecode(response.body);
          print(data);
          Fluttertoast.showToast(
              msg: "Unauthorized",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.black,
              fontSize: 16.0);
        }
      });
    });
  }

  // var player_id;

  // func() async {
  //   var status = await OneSignal.shared.getDeviceState();

  //   var playerId = status?.userId;
  //   print(playerId);
  //   setState(() {
  //     playerId = playerId;
  //   });
  // }

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

  bool _showPassword = false;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // func();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: ,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0DA6FD)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          title: Text(
            "Absolute",
            style: TextStyle(
                fontFamily: 'CabinRegular',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            // textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Flexible(
              //     flex: 1,
              //     child: Stack(
              //       children: [
              //         Positioned(
              //           top: -75,
              //           right: 0,
              //           left: 0,
              //           child: Container(
              //             width: 430,
              //             height: 144,
              //             decoration: BoxDecoration(
              //                 color: Color(0xff0DA6FD),
              //                 borderRadius: BorderRadius.circular(33)),
              //           ),
              //         ),
              //         Positioned(
              //           top: 15,
              //           left: 130,
              //           right: 50,
              //           bottom: 0,
              //           child: Text(
              //             "Absolute",
              //             style: TextStyle(
              //                 fontFamily: GoogleFonts.cabin().fontFamily,
              //                 fontSize: 25,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.white),
              //             // textAlign: TextAlign.center,
              //           ),
              //         ),
              //       ],
              //     )),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back !",
                      style: TextStyle(
                          fontFamily: GoogleFonts.workSans().fontFamily,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Text(
                      "Sign in your account",
                      style: TextStyle(
                          fontFamily: GoogleFonts.workSans().fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: email_,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9))),
                                labelText: 'Email',
                              ),
                              validator: (value) => value!.isEmpty
                                  ? "Field Can't be empty"
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextFormField(
                              controller: password_,
                              obscureText: !_showPassword,
                              validator: (value) => value!.isEmpty
                                  ? "Field Can't be empty"
                                  : null,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(_showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9))),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.019,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpPage(email: "email")));
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontFamily: GoogleFonts.workSans().fontFamily,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    islogin == false
                        ? InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  islogin = true;
                                });
                                login(email_.text, password_.text);
                              }
                            },
                            child: Container(
                              width: 365,
                              height: 59,
                              decoration: BoxDecoration(
                                  color: Color(0xff31B2FB),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.workSans().fontFamily,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        : SpinKitThreeInOut(
                            color: Colors.black,
                            size: 20,
                          ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 98,
                            height: 0.5,
                            color: Colors.black,
                          ),
                          Text(
                            "Or Login with",
                            style: TextStyle(
                                fontFamily: GoogleFonts.workSans().fontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            width: 70,
                            height: 0.5,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Center(
                      child: Image(
                        image: AssetImage('images/smartphone 1.png'),
                        height: 40,
                        width: 28.58,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                              fontFamily: GoogleFonts.workSans().fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            });
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontFamily: GoogleFonts.workSans().fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
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
    );
  }
}
