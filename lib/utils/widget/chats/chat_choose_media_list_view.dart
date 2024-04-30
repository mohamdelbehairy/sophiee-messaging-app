import 'package:flutter/material.dart';
import 'package:sophiee/models/send_message_items_model.dart';

class ChatChooseMediaListView extends StatelessWidget {
  const ChatChooseMediaListView(
      {super.key, required this.size, required this.itemsList});

  final Size size;
  final List<SendMessageItemdModel> itemsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .1,
      color: const Color(0xfff1f1f2),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 12, right: index == 6 ? 12 : 0),
              child: GestureDetector(
                onTap: itemsList[index].onPressed,
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: size.height * .029,
                        backgroundColor: itemsList[index].backgroundIconColor,
                        child: Transform.rotate(
                          angle: index == 1 ? .9 : 0,
                          child: Icon(itemsList[index].iconData,
                              size: itemsList[index].iconSize,
                              color: Colors.white),
                        )),
                    const SizedBox(height: 4),
                    Text(itemsList[index].itemName,
                        style: const TextStyle(color: Colors.black))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
