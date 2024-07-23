import 'package:flutter/material.dart';

import '../../../constants.dart';

AppBar myStoryAppBar(Size size) {
  return AppBar(
    titleSpacing: size.width * -.02,
    backgroundColor: kPrimaryColor,
    title: Text('My status',
        style: TextStyle(
            fontSize: size.height * .03, fontWeight: FontWeight.normal)),
  );
}