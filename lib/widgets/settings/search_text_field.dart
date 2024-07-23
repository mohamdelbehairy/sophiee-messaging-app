import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.suffixIcon,
      required this.onTap,
      required this.controller});
  final String hintText;
  final Function(String) onChanged;
  final IconData? suffixIcon;
  final Function() onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .045,
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(22)),
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.white, fontSize: size.width * .034),
          prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass,
              color: Colors.white, size: 16),
          suffixIcon: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child:
                Icon(suffixIcon, color: Colors.white, size: size.height * .025),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: kPrimaryColor));
  }
}
