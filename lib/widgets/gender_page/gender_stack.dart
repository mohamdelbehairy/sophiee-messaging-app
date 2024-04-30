import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  const CustomStack(
      {super.key, required this.image,
      required this.genderName,
      required this.index,
      required this.onCardTapped,
      required this.isSelected});
  final String image;
  final String genderName;
  final int index;
  final Function(int) onCardTapped;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCardTapped(index);
      },
      child: Stack(
        children: [
          Container(
            height: 160,
            width: 140,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(.2),
                offset: const Offset(10, 10),
                spreadRadius: 0,
              )
            ]),
            child: Card(
              color: isSelected ? Colors.white : Colors.grey[300],
              elevation: 10,
            ),
          ),
          Positioned(
              top: 45,
              right: 50,
              child: Image.asset(
                image,
                height: 50,
                width: 50,
              )),
          Positioned(
              top: 105,
              right: 55,
              child: Text(
                genderName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          Positioned(
            top: 20,
            right: 10,
            child: CircleAvatar(
                backgroundColor: isSelected
                    ? kPrimaryColor
                    : const Color(0xff2b2c33).withOpacity(.1),
                radius: 12,
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 18,
                        color: Colors.white,
                      )
                    : null),
          )
        ],
      ),
    );
  }
}
