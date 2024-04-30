import 'package:sophiee/models/message_model.dart';
import 'package:flutter/material.dart';

class CustomMessageContact extends StatelessWidget {
  const CustomMessageContact(
      {super.key,
      required this.message,
      required this.backgrougColor,
      required this.color,
      required this.textColor});
  final MessageModel message;
  final Color backgrougColor;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String formattedPhoneNumber = message.phoneContactNumber!.startsWith('+2')
        ? '+2${message.phoneContactNumber!.substring(2, 3)} ${message.phoneContactNumber!.substring(3, 6)} ${message.phoneContactNumber!.substring(7)}'
        : '+2${message.phoneContactNumber!.substring(0, 1)} ${message.phoneContactNumber!.substring(1, 4)} ${message.phoneContactNumber!.substring(4)}';
    return SizedBox(
      height: size.height * .06,
      width: size.width * .45,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: size.width * .02),
                  CircleAvatar(
                    radius: size.width * .04,
                    backgroundColor: backgrougColor,
                    child: Icon(Icons.contact_phone,
                        color: color, size: size.width * .045),
                  ),
                  SizedBox(width: size.width * .03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.phoneContactName!,
                        style: TextStyle(color: textColor),
                      ),
                      Text(
                        formattedPhoneNumber,
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
