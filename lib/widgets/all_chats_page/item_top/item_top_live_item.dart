import 'package:flutter/material.dart';

class ItemTopLiveItem extends StatelessWidget {
  const ItemTopLiveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: BorderRadius.circular(16)),
        child: const Center(
            child: Text('Live',
                style: TextStyle(fontSize: 12, color: Colors.white))));
  }
}