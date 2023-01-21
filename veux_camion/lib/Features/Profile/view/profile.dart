import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veux_camion/Features/Profile/view/machinery_details.dart';

class Profile {
  String? img, name, img1;

  Profile({
    this.img,
    this.name,
    this.img1,
  });
}

List<Profile> specialDrawerItem = [
  Profile(
    img:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
    name: "Machinery For Rent",
    img1:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
  ),
  Profile(
    img:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
    name: "Settings",
    img1:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
  ),
  Profile(
    img:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
    name: "Privacy & Policy",
    img1:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
  ),
  Profile(
    img:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
    name: "About Us",
    img1:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
  ),
  Profile(
    img:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
    name: "Contact Us",
    img1:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
  ),
  Profile(
    img:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
    name: "Log Out",
    img1:
        "https://www.figma.com/file/B65gIZ6j76jRTnLslIeVmx/New-Absolute?node-id=252%3A47&t=LhOeSbKwZ2lnnf04-4",
  ),
];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00A3FF),
        toolbarHeight: 70,
        leading: InkWell(
            onTap: () {
             setState(() {
                Navigator.pop(context);
             });
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "My Profile",
          style: TextStyle(
              fontFamily: GoogleFonts.workSans().fontFamily,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Image(image: AssetImage("images/Vector 6.png"))),
                Positioned(
                    child: Image(image: AssetImage("images/Vector 5.png"))),
                Positioned(
                  top: 65,
                  left: 25,
                  child: CircleAvatar(
                    // backgroundColor: Colors.white,
                    radius: 60,
                    backgroundImage: AssetImage("images/profile 1.png"),
                  ),
                ),
                Positioned(
                  top: 85,
                  left: 150,
                  child: Text(
                    "Patrick \nBateman",
                    style: TextStyle(
                        fontFamily: GoogleFonts.workSans().fontFamily,
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.010,
            ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: BouncingScrollPhysics(),
            //     itemCount: specialDrawerItem.length,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           navigatorRoutinDrawer(
            //               specialDrawerItem[index].name.toString(), context);
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Container(
            //             // height: size.height * 0.20,
            //             // width: double.infinity,
            //             color: Colors.transparent,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Row(
            //                     children: [
            //                       // Image(
            //                       //   image: NetworkImage(specialDrawerItem[index]
            //                       //       .img
            //                       //       .toString()),
            //                       // ),
            //                       SizedBox(width: 8),
            //                       Text(
            //                         "${specialDrawerItem[index].name.toString()}",
            //                         style: const TextStyle(
            //                             color: Colors.black,
            //                             fontWeight: FontWeight.w700,
            //                             fontSize: 18),
            //                       ),
            //                       SizedBox(width: 8),
            //                       // Image(
            //                       //   image: NetworkImage(specialDrawerItem[index]
            //                       //       .img1
            //                       //       .toString()),
            //                       // ),
            //                     ],
            //                   ),
            //                 ),
            //                 SizedBox(height: 4),
            //                 Container(
            //                   color: Colors.blue,
            //                   height: 1,
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     })

            InkWell(
              onTap: () {
               setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MachineryDetails()));
               });
              },
              child: Row(
                children: [
                  // SizedBox(
                  //   width: size.width * 0.020,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon1.png"))),
                  // SizedBox(
                  //   width: size.width * 0.050,
                  // ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Machinery For Rent",
                      style: const TextStyle(
                          color: Color(0xff004369),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),

                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon7.png"))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: 2,
                color: Color(0xff0087D3),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  // SizedBox(
                  //   width: size.width * 0.020,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon2.png"))),
                  // SizedBox(
                  //   width: size.width * 0.050,
                  // ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Settings",
                      style: const TextStyle(
                          color: Color(0xff004369),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.50,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon7.png"))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: 2,
                color: Color(0xff0087D3),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  // SizedBox(
                  //   width: size.width * 0.025,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon3.png"))),
                  // SizedBox(
                  //   width: size.width * 0.080,
                  // ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Privacy & Policy",
                      style: const TextStyle(
                          color: Color(0xff004369),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.36,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon7.png"))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: 2,
                color: Color(0xff0087D3),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  // SizedBox(
                  //   width: size.width * 0.025,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon4.png"))),
                  // SizedBox(
                  //   width: size.width * 0.075,
                  // ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "About Us",
                      style: const TextStyle(
                          color: Color(0xff004369),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.47,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon7.png"))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: 2,
                color: Color(0xff0087D3),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  // SizedBox(
                  //   width: size.width * 0.020,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon5.png"))),
                  // SizedBox(
                  //   width: size.width * 0.050,
                  // ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Contact Us",
                      style: const TextStyle(
                          color: Color(0xff004369),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.43,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon7.png"))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: 2,
                color: Color(0xff0087D3),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  // SizedBox(
                  //   width: size.width * 0.025,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon6.png"))),
                  // SizedBox(
                  //   width: size.width * 0.090,
                  // ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Log Out",
                      style: const TextStyle(
                          color: Color(0xff004369),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.50,
                  // ),
                  Expanded(
                      flex: 2,
                      child: Image(image: AssetImage("images/icon7.png"))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: 2,
                color: Color(0xff0087D3),
              ),
            ),
            SizedBox(
              height: size.height * 0.050,
            ),
          ],
        ),
      ),
    );
  }
}

void navigatorRoutinDrawer(String rountName, context) async {
  switch (rountName) {
    case "Machinery For Rent":
      {
        // Get.to(AlarmScreen());
      }
      break;
    case "Settings":
      {
        // Get.to(CategoryProuctScreen(
        //   token: "token",
        //   id: 5,
        // ));
      }
      break;

    case "Privacy & Policy":
      {
        // Get.to(CategoryProuctScreen(
        //   token: "token",
        //   id: 2,
        // ));
      }
      break;
    case "About Us":
      {
        // Get.to(CategoryProuctScreen(
        //   token: "token",
        //   id: 1,
        // ));
      }
      break;
    case "Contact Us":
      {
        // Get.to(CategoryProuctScreen(
        //   token: "token",
        //   id: 3,
        // ));
      }
      break;
    case "Log Out":
      {
        // Get.to(CategoryProuctScreen(
        //   token: "token",
        //   id: 3,
        // ));
      }
      break;
  }
}
