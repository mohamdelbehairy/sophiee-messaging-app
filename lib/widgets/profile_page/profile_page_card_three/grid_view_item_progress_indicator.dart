import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridViewItemProgressIndicator extends StatelessWidget {
  const GridViewItemProgressIndicator(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .15,
      width: size.width,
      child: Card(
        elevation: 0,
        color: isDark ? Colors.white12 : Colors.grey.shade100,
        child: Shimmer.fromColors(
          baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
          highlightColor: isDark ? Colors.white24 : Colors.grey.shade100,
          child: Column(
            children: [
              Container(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
