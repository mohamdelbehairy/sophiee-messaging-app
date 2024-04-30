import 'package:sophiee/widgets/all_chats_page/calls_page/custom_calls_page_body.dart';
import 'package:flutter/material.dart';

class CallsPageBody extends StatelessWidget {
  const CallsPageBody({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return CustomCallsPageBody(isDark: isDark);
        });
  }
}
