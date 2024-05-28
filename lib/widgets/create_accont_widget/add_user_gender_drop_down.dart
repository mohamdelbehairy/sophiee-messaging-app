import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddUserGenderDropDown extends StatelessWidget {
  const AddUserGenderDropDown(
      {super.key,
      required this.size,
      required this.iconColor,
      required this.items,
      required this.gender,
      required this.isLoading});

  final Size size;
  final Color iconColor;
  final List<String> items;
  final TextEditingController gender;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: isLoading ? size.width * .035 : 0.0,
        right: size.width * .015,
        child: isLoading
            ? Icon(FontAwesomeIcons.caretDown,
                color: iconColor, size: size.width * .045)
            : DropdownButton(
                icon: Icon(FontAwesomeIcons.caretDown,
                    color: iconColor, size: size.width * .045),
                items: items.map((item) {
                  return DropdownMenuItem(
                      value: item,
                      child:
                          SizedBox(width: size.width * .8, child: Text(item)));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    gender.text = value;
                  }
                },
                underline: Container(),
                borderRadius: BorderRadius.circular(size.width * .03)));
  }
}
