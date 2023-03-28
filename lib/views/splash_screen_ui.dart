// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_travel_app/views/login_ui.dart';

class Splash_Ui extends StatefulWidget {
  const Splash_Ui({super.key});

  @override
  State<Splash_Ui> createState() => _Splash_UiState();
}

class _Splash_UiState extends State<Splash_Ui> {
  @override
  void initState() {
    //ทำหน้านี้ให้เป็น SplashScreen
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home_Ui(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              'บันทึกการเดินทาง',
              style: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.width * 0.09,
                  color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              'Created by : 6319410018\n Pattarapong Ekwongsa',
              style: GoogleFonts.kanit(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
