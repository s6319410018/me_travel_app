// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Register_Ui extends StatefulWidget {
  const Register_Ui({super.key});

  @override
  State<Register_Ui> createState() => _Register_UiState();
}

class _Register_UiState extends State<Register_Ui> {
  //ควบคุมรหัส
  bool passwordShow = true;

  File? imgFile;
//create method camera & Gallery
  seleceimagesFromGallery() async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  seleceimagesFromCamera() async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);
  }

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
                  onPressed: () {
                    // open modalbuttom
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(FontAwesomeIcons.camera),
                              title: Text('ถ่ายรูป'),
                              onTap: () {
                                seleceimagesFromCamera();
                              },
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.camera),
                              title: Text('เลือกรูป'),
                              onTap: () {
                                seleceimagesFromGallery();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(FontAwesomeIcons.cameraRetro),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.15,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                bottom: MediaQuery.of(context).size.width * 0.05),
            child: TextField(
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                label: Text('ชื่อ-สกุล'),
                labelStyle: GoogleFonts.kanit(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'ป้อนชื่อและนามสกุล',
                hintStyle:
                    GoogleFonts.kanit(color: Color.fromARGB(255, 67, 60, 60)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                bottom: MediaQuery.of(context).size.width * 0.05),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                label: Text('อีเมล์'),
                labelStyle: GoogleFonts.kanit(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'ป้อนอีเมล์',
                hintStyle:
                    GoogleFonts.kanit(color: Color.fromARGB(255, 67, 60, 60)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                bottom: MediaQuery.of(context).size.width * 0.05),
            child: TextField(
              keyboardType: TextInputType.phone,
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                label: Text('เบอร์โทร'),
                labelStyle: GoogleFonts.kanit(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'ป้อนเบอร์โทร',
                hintStyle:
                    GoogleFonts.kanit(color: Color.fromARGB(255, 67, 60, 60)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                bottom: MediaQuery.of(context).size.width * 0.05),
            child: TextField(
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                label: Text('ชื่อผู้ใช้'),
                labelStyle: GoogleFonts.kanit(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'ป้อนผู้ใช้',
                hintStyle:
                    GoogleFonts.kanit(color: Color.fromARGB(255, 67, 60, 60)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                bottom: MediaQuery.of(context).size.width * 0.05),
            child: TextField(
              obscureText: passwordShow,
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        if (passwordShow == true) {
                          passwordShow = false;
                        } else {
                          passwordShow = true;
                        }
                      });
                    },
                    icon: Icon(
                      passwordShow == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    )),
                label: Text('รหัสผ่าน'),
                labelStyle: GoogleFonts.kanit(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'ป้อนรหัสผ่าน',
                hintStyle:
                    GoogleFonts.kanit(color: Color.fromARGB(255, 67, 60, 60)),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'ลงทะเบียน',
              style: GoogleFonts.kanit(),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                    MediaQuery.of(context).size.width * 0.0125),
                backgroundColor: Colors.green[300]),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
        ]),
      )),
    );
  }
}
