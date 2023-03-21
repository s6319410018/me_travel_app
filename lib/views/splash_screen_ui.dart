// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Splash_Ui extends StatefulWidget {
  const Splash_Ui({super.key});

  @override
  State<Splash_Ui> createState() => _Splash_UiState();
}

class _Splash_UiState extends State<Splash_Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
