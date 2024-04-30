import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem(
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
      padding: EdgeInsets.all(size.width * .02),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(size.height * .022),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white),
          SizedBox(width: size.width * .035),
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
