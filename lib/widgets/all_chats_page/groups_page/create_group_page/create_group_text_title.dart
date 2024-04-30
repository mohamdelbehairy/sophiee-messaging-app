import 'package:flutter/material.dart';

class CreateGroupTextTitle extends StatelessWidget {
  const CreateGroupTextTitle({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: size.width * .04,
            top: size.height * .015,
            bottom: size.height * .015),
        child: Text('Friends on SophieeApp',
            style: TextStyle(color: Colors.grey, fontSize: size.width * .035)));
  }
}
