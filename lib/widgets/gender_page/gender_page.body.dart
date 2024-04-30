import 'package:sophiee/constants.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:sophiee/widgets/gender_page/gender_stack.dart';
import 'package:flutter/material.dart';

class GenderPageBody extends StatefulWidget {
  const GenderPageBody({super.key});

  @override
  State<GenderPageBody> createState() => _GenderPageBodyState();
}

class _GenderPageBodyState extends State<GenderPageBody> {
  int selectedCardIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi Mohamed, Choose Gender',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Just help know most overall experience\n by using our apps',
                style: TextStyle(fontSize: 18)),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .08,
                ),
                CustomStack(
                  index: 0,
                  genderName: 'Male',
                  image: 'assets/images/male.png',
                  onCardTapped: (index) {
                    selectedCardIndex = index;
                    setState(() {});
                  },
                  isSelected: selectedCardIndex == 0,
                ),
                CustomStack(
                  index: 1,
                  genderName: 'Female',
                  image: 'assets/images/female.png',
                  onCardTapped: (index) {
                    selectedCardIndex = index;
                    setState(() {});
                  },
                  isSelected: selectedCardIndex == 1,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .4),
            CustomBottom(
              width: double.infinity,
              borderRadius: BorderRadius.circular(32),
                text: 'Continue Setup',
                colorBottom: kPrimaryColor,
                colorText: Colors.white,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return VerificationPage();
                  // }));
                }),
          ],
        ),
      ),
    );
  }
}
