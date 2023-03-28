// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_travel_app/views/register_ui.dart';

class Home_Ui extends StatefulWidget {
  const Home_Ui({super.key});

  @override
  State<Home_Ui> createState() => _Home_UiState();
}

class _Home_UiState extends State<Home_Ui> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
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
                child: TextField(),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
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
                onPressed: () {},
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
