  import 'package:flutter/material.dart';

import '../../../constants.dart';

AppBar showNotificationAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      title: const Text('Notifications',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 26)),
    );
  }