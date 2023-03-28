// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Register_Ui extends StatefulWidget {
  const Register_Ui({super.key});

  @override
  State<Register_Ui> createState() => _Register_UiState();
}

class _Register_UiState extends State<Register_Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text(
          'ลงทะเบียน',
          style: GoogleFonts.kanit(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.15,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.15,
                  child: ClipOval(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.cameraRetro),
                ),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
