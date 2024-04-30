import 'package:sophiee/constants.dart';
import 'package:sophiee/widgets/all_chats_page/stack_item_bottom.dart';
import 'package:flutter/material.dart';

class CustomCallsPageBody extends StatelessWidget {
  const CustomCallsPageBody({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Column(
        children: [
          Row(
            children: [
              StackItemBottom(isDark: isDark),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Mohamed Elbehairy',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const CircleAvatar(
                        radius: 5,
                        backgroundColor: kPrimaryColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_missed,
                        size: 14,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'You missed 3 voice call',
                        style: TextStyle(
                            // fontSize: 15,
                            color: Colors.red.shade300),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .15),
              const Expanded(
                  child: Icon(
                Icons.videocam,
                color: kPrimaryColor,
                size: 30,
              )),
              const Expanded(
                  child: Icon(
                Icons.call,
                color: Colors.blue,
                size: 25,
              )),
            ],
          )
        ],
      ),
    );
  }
}
