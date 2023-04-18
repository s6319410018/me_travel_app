// ignore_for_file: camel_case_types, prefer_is_empty

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_travel_app/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../Utils/db_helper.dart';

class Register_Ui extends StatefulWidget {
  const Register_Ui({super.key});

  @override
  State<Register_Ui> createState() => _Register_UiState();
}

class _Register_UiState extends State<Register_Ui> {
  TextEditingController fullnameCtrl = TextEditingController(text: '');
  TextEditingController emailCtrl = TextEditingController(text: '');
  TextEditingController phoneCtrl = TextEditingController(text: '');
  TextEditingController usernameCtrl = TextEditingController(text: '');
  TextEditingController passwordCtrl = TextEditingController(text: '');

//สร้างตัวแปรควบคุมรหัสผ่าน
  bool passwordShowFlag = true;

//สร้างตัวแปรเพื่ออ้างอิงกับรูปที่มาจาก Gallery/Camera เพื่อแสดงที่หน้าจอ
  File? imgFile;

  //สร้างตัวแปรเก็บตำแหน่งรูปถ่าย/เลือก เผื่อจะเก็บใน Database: Sqlite
  String? pictureDir = '';

//สร้างเมธอดเปิด Gallery
  seleceimagesFromGallery() async {
    //เลือกรูปจาก Gallery
    XFile? img = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (img == null) return; // กรณีเปิด Gallery แล้วไม่เลือกให้ยกเลิก

    //จะเปลี่ยนชื่อรูปและนำรูปไปวไ้ใน ไดเรคทอรี่ของแอป
    Directory directory = await getApplicationDocumentsDirectory();
    String newFileDir = directory.path + Uuid().v4();
    pictureDir = newFileDir; //กำหนดที่อยู่รูปให้กับตัวแปรที้่สร้างไว้ Database

    //แสดงรูปที่หน้าจอ

    File imgFileNew = File(newFileDir);
    await imgFileNew.writeAsBytes(File(img.path).readAsBytesSync());
    setState(() {
      imgFile = imgFileNew;
    });
  }

//สร้างเมธตอดเปิด Camera
  seleceimagesFromCamera() async {
    //เลือกรูปจาก Camera
    XFile? img = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (img == null) return; // กรณีเปิด Gallery แล้วไม่เลือกให้ยกเลิก

    //จะเปลี่ยนชื่อรูปและนำรูปไปวไ้ใน ไดเรคทอรี่ของแอป
    Directory directory = await getApplicationDocumentsDirectory();
    String newFileDir = directory.path + Uuid().v4();
    pictureDir = newFileDir; //กำหนดที่อยู่รูปให้กับตัวแปรที้่สร้างไว้ Database

    //แสดงรูปที่หน้าจอ

    File imgFileNew = File(newFileDir);
    await imgFileNew.writeAsBytes(File(img.path).readAsBytesSync());
    setState(() {
      imgFile = imgFileNew;
    });
  }

//สร้างเมธตอดแสดง Dialog เป็นข้อความเตือน
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

  Future showCompreateDialog(BuildContext context, String msg) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'ผลการทำงาน',
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

  //สร้างเมธตอดบันทึกข้อมูล User
  saveUserToDB(context) async {
    int id = await DBHelper.createUser(
      User(
        fullname: fullnameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        phone: phoneCtrl.text.trim(),
        username: usernameCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        picture: pictureDir,
      ),
    );

    if (id != 0) {
      showCompreateDialog(context, 'บันทึกข้อมูลเรียบร้อยแล้ว').then(
        (value) => Navigator.pop(context),
      );
    } else {
      showCompreateDialog(context, 'มีข้อผิดพลาดเกิดขึ้นในการบันทึกข้อมูล');
    }
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
                imgFile == null
                    ? CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        child: ClipOval(
                          child: Image.asset('assets/images/logo.png'),
                        ),
                      )
                    : CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundImage: FileImage(imgFile!),
                      ),
                IconButton(
                  onPressed: () {
                    // open modalbuttom
                    showModalBottomSheet(
                      backgroundColor: Colors.green[200],
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(FontAwesomeIcons.camera,
                                  color: Colors.black),
                              title: Text(
                                'ถ่ายรูป',
                                style: GoogleFonts.kanit(color: Colors.black),
                              ),
                              onTap: () {
                                seleceimagesFromCamera();
                                Navigator.pop(context);
                              },
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(
                                Icons.camera,
                                color: Colors.black,
                              ),
                              title: Text(
                                'เลือกรูป',
                                style: GoogleFonts.kanit(color: Colors.black),
                              ),
                              onTap: () {
                                seleceimagesFromGallery();
                                Navigator.pop(context);
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
              controller: fullnameCtrl,
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                label: Text(
                  'ชื่อ-สกุล',
                  style: GoogleFonts.kanit(color: Colors.black),
                ),
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
              controller: emailCtrl,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                label: Text(
                  'อีเมล์',
                  style: GoogleFonts.kanit(color: Colors.black),
                ),
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
              controller: phoneCtrl,
              keyboardType: TextInputType.phone,
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                label: Text(
                  'เบอร์โทร',
                  style: GoogleFonts.kanit(color: Colors.black),
                ),
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
              controller: usernameCtrl,
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                label: Text(
                  'ชื่อผู้ใช้',
                  style: GoogleFonts.kanit(color: Colors.black),
                ),
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
              controller: passwordCtrl,
              obscureText: passwordShowFlag,
              style: GoogleFonts.kanit(color: Colors.black),
              decoration: InputDecoration(
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        if (passwordShowFlag == true) {
                          passwordShowFlag = false;
                        } else {
                          passwordShowFlag = true;
                        }
                      });
                    },
                    icon: Icon(
                      passwordShowFlag == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    )),
                label: Text(
                  'รหัสผ่าน',
                  style: GoogleFonts.kanit(color: Colors.black),
                ),
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
            onPressed: () {
              //validate screen check input all ** dialog **input database sqlite chang screen Login
              if (fullnameCtrl.text.trim().length == 0) {
                showWarningDialog(context, 'ป้อนชื่อ-สกุล');
              } else if (emailCtrl.text.trim().length == 0) {
                showWarningDialog(context, 'ป้อนอีเมล์');
              } else if (phoneCtrl.text.trim().length == 0) {
                showWarningDialog(context, 'ป้อนเบอร์');
              } else if (usernameCtrl.text.trim().length == 0) {
                showWarningDialog(context, 'ป้อนชื่อผู้ใช้');
              } else if (emailCtrl.text.trim().length == 0) {
                showWarningDialog(context, 'ป้อนอีเมล์');
              } else if (passwordCtrl.text.trim().length == 0) {
                showWarningDialog(context, 'ป้อนพาสเวิร์ด');
              } else if (pictureDir!.length == 0) {
                showWarningDialog(context, 'ใส่รูป');
              } else {
                saveUserToDB(context);
              }
            },
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
