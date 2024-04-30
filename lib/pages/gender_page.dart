import 'package:sophiee/widgets/gender_page/gender_page.body.dart';
import 'package:flutter/material.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.withOpacity(.010),
        elevation: 0,
      ),
      body: const GenderPageBody(),
    );
  }
}
