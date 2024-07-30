import 'package:flutter/material.dart';

import '../../../../utils/methods/initial_state.dart';

class PickImagePageAppBarleading extends StatelessWidget {
  const PickImagePageAppBarleading({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
          InitialState.initPickImageState(context);
        },
        child: const Icon(Icons.arrow_back));
  }
}
