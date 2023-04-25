// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_travel_app/Utils/db_helper.dart';
import 'package:me_travel_app/views/register_ui.dart';
import 'package:me_travel_app/views/travel_home_ui.dart';

import '../models/user.dart';

class Home_Ui extends StatefulWidget {
  const Home_Ui({super.key});

  @override
  State<Home_Ui> createState() => _Home_UiState();
}

class _Home_UiState extends State<Home_Ui> {
  //validate signin  user password
  checkSignin(BuildContext context) async {
    User? user =
        await DBHelper.signinUser(usernameCtrl.text, passwordCtrl.text);
    if (user == null) {
      showWarningDialog(context, 'username/password ไม่ถูกต้อง');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TravelHomeUi(user: user),
        ),
      );
    }
  }

  //ไว้เก็บค่า
  TextEditingController usernameCtrl = TextEditingController(text: '');
  TextEditingController passwordCtrl = TextEditingController(text: '');

  bool isShowpassword = false;
  showWarningDialog(BuildContext context, String msg) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'คำเตือน',
            style: GoogleFonts.kanit(),
          ),
          content: Text(
            msg,
            style: GoogleFonts.kanit(),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: GoogleFonts.kanit(),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Center(
          child: Text(
            'บันทึกการเดินทาง',
            style: GoogleFonts.kanit(),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*  SizedBox(
                height: MediaQuery.of(context).size.width * 0.05, 
              ),*/
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Text(
                'เข้าใช้งานแอปพลิเคชั่น',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.width * 0.07),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Text(
                'บันทึกการเดินทาง',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15),
                child: Row(
                  children: [
                    Text(
                      'ชื่อผู้ใช้ : ',
                      style: GoogleFonts.kanit(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.15,
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: TextField(
                    controller: usernameCtrl, style: GoogleFonts.kanit()),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.06),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15),
                child: Row(
                  children: [
                    Text(
                      'รหัสผ่าน : ',
                      style: GoogleFonts.kanit(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.15,
                  left: MediaQuery.of(context).size.width * 0.15,
                ),
                child: TextField(
                  controller: passwordCtrl,
                  style: GoogleFonts.kanit(),
                  obscureText: !isShowpassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (isShowpassword == true) {
                            isShowpassword = false;
                          } else {
                            isShowpassword = true;
                          }
                        });
                      },
                      icon: isShowpassword == true
                          ? Icon(
                              Icons.visibility,
                              color: Colors.green[200],
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Colors.green[200],
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  //validate data  usernameCtrl.text.trim().lenght == 0
                  if (usernameCtrl.text.isEmpty) {
                    showWarningDialog(context, 'กรอกชื่อผู้ใช้');
                  } else if (passwordCtrl.text.isEmpty) {
                    showWarningDialog(context, 'กรุณากรอกรหัสผ่าน');
                  } else {
                    checkSignin(context);
                  }
                },
                child: Text(
                  'SIGN IN',
                  style: GoogleFonts.kanit(),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                        MediaQuery.of(context).size.width * 0.0125),
                    backgroundColor: Colors.green[300]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  Text(
                    ' จำค่าการเข้าใช้งานแอปพลิเคชั่น ',
                    style: GoogleFonts.kanit(
                        fontSize: MediaQuery.of(context).size.width * 0.04),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register_Ui(),
                    ),
                  );
                },
                child: Text(
                  'ลงทะเบียนเข้าใช้งาน ',
                  style: GoogleFonts.kanit(
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green[50],
    );
  }
}
