import 'package:flutter/material.dart';

class SearchPageResentSearch extends StatelessWidget {
  const SearchPageResentSearch(
      {super.key, required this.isDark, required this.size});

  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Recent Search',
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.grey,
                  fontSize: size.width * .04)),
          Text('Clear History',
              style: TextStyle(color: Colors.blue, fontSize: size.width * .04)),
        ],
      ),
    );
  }
}
