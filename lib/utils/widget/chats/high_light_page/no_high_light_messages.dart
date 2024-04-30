import 'package:flutter/material.dart';

class NoHighLighMessages extends StatelessWidget {
  const NoHighLighMessages({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/highLightMessage.png',
                height: size.height * .15, width: size.width * .55),
            Padding(
              padding: EdgeInsets.only(left: size.width * .055),
              child: Text('No messages found yet.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.normal)),
            )
          ],
        ),
      ],
    );
  }
}
