import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta/meta_meta.dart';

class Travel_Ui extends StatefulWidget {
  const Travel_Ui({super.key});

  @override
  State<Travel_Ui> createState() => _Travel_UiState();
}

class _Travel_UiState extends State<Travel_Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 109, 221, 113),
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        centerTitle: true,
        title: Text(
          'บันทึกการเดินทาง',
          style: GoogleFonts.kanit(color: Color.fromARGB(255, 1, 1, 1)),
        ),
      ),
    );
  }
}
