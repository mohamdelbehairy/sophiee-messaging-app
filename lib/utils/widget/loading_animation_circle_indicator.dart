import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../constants.dart';

class LoadingAnimationCircleIndicator extends StatelessWidget {
  const LoadingAnimationCircleIndicator({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
          color: kPrimaryColor, size: size.height * .04),
    );
  }
}