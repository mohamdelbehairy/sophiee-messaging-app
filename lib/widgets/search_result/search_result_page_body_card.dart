import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/search_result/search_result_page_card_contact.dart';
import 'package:sophiee/widgets/search_result/search_result_page_card_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultPageBodyCard extends StatelessWidget {
  const SearchResultPageBodyCard(
      {super.key, required this.user, required this.userData});
  final UserModel user;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;

    return Container(
      height: size.height * .6,
      width: size.width,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * .05, vertical: size.height * .01),
      child: Card(
        color: isDark ? const Color(0xff2b2c33) : Colors.white,
        child: Column(
          children: [
            SearchResultCardListTile(user: user, userData: userData),
            // SearchResultPageCardInfo(user: user),
            SizedBox(height: size.height * .02),
            const SearchResultPageCardContact(
                contactName: 'Contact Info',
                contactValue: 'Milan.myles@gmail.com',
                color: Colors.blue,
                icon: Icons.email),
            SizedBox(height: size.height * .015),
            const SearchResultPageCardContact(
                contactName: 'Phone Call',
                contactValue: '+20 111 2222022',
                color: kPrimaryColor,
                icon: Icons.call),
          ],
        ),
      ),
    );
  }
}
