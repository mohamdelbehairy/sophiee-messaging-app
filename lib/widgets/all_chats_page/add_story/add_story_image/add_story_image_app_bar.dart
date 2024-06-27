 import 'package:flutter/material.dart';

import '../../../../utils/initial_state.dart';

AppBar addStoryImageAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              InitialState.initPickImageState(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)));
  }