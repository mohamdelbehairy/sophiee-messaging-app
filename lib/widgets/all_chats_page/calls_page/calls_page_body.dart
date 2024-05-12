import 'package:sophiee/widgets/all_chats_page/calls_page/calls_page_body_component.dart';
import 'package:flutter/material.dart';

class CallsPageBody extends StatelessWidget {
  const CallsPageBody({super.key, required this.isDark, required this.size});

  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return CallsPageBodyComponent(isDark: isDark,size: size);
        });
  }
}
