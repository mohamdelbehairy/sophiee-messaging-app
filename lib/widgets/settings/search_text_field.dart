import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      padding: const EdgeInsets.only(left: 20, top: 1, bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(22)),
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.magnifyingGlass, color: Colors.white,size: 16),
          const SizedBox(width: 14),
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: Colors.white,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: size.height * .016),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle:
                    TextStyle(color: Colors.white, fontSize: size.width * .034),
                suffixIcon: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: onTap,
                  child: Icon(suffixIcon,
                      color: Colors.white, size: size.height * .025),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
