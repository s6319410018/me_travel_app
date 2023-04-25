import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me_travel_app/views/travel_record_ui.dart';

import '../models/user.dart';

class TravelHomeUi extends StatefulWidget {
  User? user;

  TravelHomeUi({super.key, this.user});

  @override
  State<TravelHomeUi> createState() => _TravelHomeUiState();
}

class _TravelHomeUiState extends State<TravelHomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text(
          'บันทึกการเดินทาง',
          style: GoogleFonts.kanit(),
        ),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.06,
          ),
          widget.user!.picture!.length == 0
              ? CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.15,
                  child: ClipOval(
                    child: Image.asset('assets/images/logo.png'),
                  ),
                )
              : CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.15,
                  backgroundImage: FileImage(
                    File(widget.user!.picture!),
                  ),
                ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.06),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.09,
                right: MediaQuery.of(context).size.width * 0.09),
            child: Card(
              color: Colors.black,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      "Name :",
                      style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Text(
                    widget.user!.fullname!,
                    style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.09,
                right: MediaQuery.of(context).size.width * 0.09),
            child: Card(
              color: Colors.black,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      "Username :",
                      style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Text(
                    widget.user!.username!,
                    style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.09,
                right: MediaQuery.of(context).size.width * 0.09),
            child: Card(
              color: Colors.black,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      "Email :",
                      style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Text(
                    widget.user!.email!,
                    style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.09,
                right: MediaQuery.of(context).size.width * 0.09),
            child: Card(
              color: Colors.black,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      "PhoneNumber :",
                      style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                  Text(
                    widget.user!.phone!,
                    style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Travel_Ui(),
                ));
          },
          label: Text('บันทึกการเดินทาง'),
          backgroundColor: Colors.green[300],
          icon: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
