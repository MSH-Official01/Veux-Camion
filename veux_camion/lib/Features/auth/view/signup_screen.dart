import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:veux_camion/Features/auth/view/signin_screen.dart';

import '../../../AppUrl/appurl.dart';
import 'signup_otp.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController first_name = TextEditingController();

  TextEditingController last_name = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController Password = TextEditingController();
  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();
  saveprefs(
    String token,
    String phone,
    String usernamem,
    String email,
    String last_name,
    String first_name,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    prefs.setString('phone', phone);
    prefs.setString('user_name', usernamem);
    prefs.setString('email', email);
    prefs.setString('last_name', last_name);
    prefs.setString('first_name', first_name);
    setState(() {
      issave = true;
    });
    if (issave == true) {
      getdata();
    }
  }

  bool issave = false;

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

  Future registerApi_(String fname, String lname, String email, String phone,
      String password_, String username) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest(
      'POST',
      Uri.parse(AppUrl.reg),
    );
    request.fields.addAll({
      'first_name': fname,
      'last_name': lname,
      'email': email,
      'username': username,
      'phone': phone,
      'password': password_
    });

    request.headers.addAll(requestHeaders);

    request.send().then((result) async {
      http.Response.fromStream(result).then((response) {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          print(data);
          print('response.body ' + data.toString());
          Fluttertoast.showToast(
              msg: "Registered  Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OtpPage(email: email)));
        } else {
          print("Fail! ");
          var data = jsonDecode(response.body);

          Fluttertoast.showToast(
              msg: data['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          return response.body;
        }
      });
    });
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
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
            //           left: 125,
            //           right: 50,
            //           bottom: 0,
            //           child: Text(
            //             "Absolute",
            //             style: TextStyle(
            //                 fontFamily: 'CabinRegular',
            //                 fontSize: 25,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white),
            //             // textAlign: TextAlign.center,
            //           ),
            //         ),
            //       ],
            //     )),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Create Account",
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
                          "Create your account to continue",
                          style: TextStyle(
                              fontFamily: GoogleFonts.workSans().fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: first_name,
                            validator: (value) =>
                                value!.isEmpty ? "Field Can't be empty" : null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF5F5F5),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: last_name,
                            validator: (value) =>
                                value!.isEmpty ? "Field Can't be empty" : null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF5F5F5),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: username,
                            validator: (value) =>
                                value!.isEmpty ? "Field Can't be empty" : null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF5F5F5),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                              labelText: 'UserName',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: email,
                            validator: (value) =>
                                value!.isEmpty ? "Field Can't be empty" : null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF5F5F5),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phone,
                            validator: (value) =>
                                value!.isEmpty ? "Field Can't be empty" : null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffF5F5F5),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9))),
                              labelText: 'Phone Number',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: Password,
                            obscureText: !_showPassword,
                            style: TextStyle(color: Colors.black),
                            validator: (value) => value!.isEmpty
                                ? "Field Can't be empty"
                                : value.length < 6
                                    ? "Password must be 6 digits"
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
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              registerApi_(
                                  first_name.text,
                                  last_name.text,
                                  email.text,
                                  phone.text,
                                  Password.text,
                                  username.text);
                            }

                            print(email.text);
                          },
                          child: Container(
                            width: 365,
                            height: 59,
                            decoration: BoxDecoration(
                                color: Color(0xff31B2FB),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.workSans().fontFamily,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.workSans().fontFamily,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.workSans().fontFamily,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
