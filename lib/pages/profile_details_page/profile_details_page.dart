import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_details_page/profile_details_page_body.dart';
import 'package:flutter/material.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage(
      {super.key, 
      required this.user
      , required this.index});
  final UserModel user;
  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ProfileDetailsPageBody(size: size, user: user, index: index);
  }
}
