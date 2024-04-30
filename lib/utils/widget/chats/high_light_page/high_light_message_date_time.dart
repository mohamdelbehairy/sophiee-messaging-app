import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/models/message_model.dart';

class HighLightMessageDateTime extends StatelessWidget {
  const HighLightMessageDateTime(
      {super.key, required this.size, required this.message});

  final Size size;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    int differenceInMinutes =
        Timestamp.now().toDate().difference(message.messageDateTime).inMinutes;
    int differenceInHours =
        Timestamp.now().toDate().difference(message.messageDateTime).inHours;
    int differenceInDays =
        Timestamp.now().toDate().difference(message.messageDateTime).inDays;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * .08, bottom: size.width * .01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Send', style: TextStyle(color: Colors.grey)),
          const Text('.', style:  TextStyle(color: Colors.black)),
          SizedBox(width: size.width * .005),
          Text(
              differenceInMinutes < 1
                  ? 'now'
                  : differenceInMinutes < 60
                      ? '$differenceInMinutes m'
                      : differenceInHours < 24
                          ? '$differenceInHours h'
                          : differenceInDays < 7
                              ? differenceInDays == 1
                                  ? '$differenceInDays d'
                                  : '$differenceInDays d'
                              : '',
              style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
