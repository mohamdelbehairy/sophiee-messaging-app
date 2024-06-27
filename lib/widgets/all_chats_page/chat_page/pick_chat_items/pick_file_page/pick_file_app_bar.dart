  import 'package:flutter/material.dart';

AppBar pickFileAppBar(String fileName,Size size) {
    return AppBar(
        titleSpacing: size.width * -.02,
        backgroundColor: const Color(0xff000101),
        title: Text(fileName,
            style: TextStyle(
                color: Colors.white,
                fontSize: size.height * .03,
                fontWeight: FontWeight.normal)));
  }