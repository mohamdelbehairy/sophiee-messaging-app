import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AddStoryAlertDialog extends StatelessWidget {
  const AddStoryAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      content: Container(
        height: size.height * .092,
        margin: EdgeInsets.symmetric(
            horizontal: size.width * .04, vertical: size.width * .04),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(size.width * .02))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.hexagonDots(color: Colors.black, size: 30),
            SizedBox(height: size.height * .022),
            const Text(
              'Please wait',
              style: TextStyle(color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
