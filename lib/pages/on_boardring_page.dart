import 'package:sophiee/constants.dart';
import 'package:sophiee/widgets/on_boardring_page/on_boardring_page_body.dart';
import 'package:sophiee/widgets/on_boardring_page/on_boardring_page_bottom_sheet.dart';
import 'package:flutter/material.dart';

class OnBoardringPage extends StatefulWidget {
  const OnBoardringPage({super.key});

  @override
  State<OnBoardringPage> createState() => _OnBoardringPageState();
}

class _OnBoardringPageState extends State<OnBoardringPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: OnBoardringPageBody(
            controller: controller,
            size: size,
            onPageChanged: (value) {
              setState(() {
                isLastPage = value == 2;
              });
            }),
        bottomSheet: OnBoardringPageBottomSheet(
            size: size, controller: controller, isLastPage: isLastPage));
  }
}
