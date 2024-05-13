import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/friends_page/friends_page_body.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            titleSpacing: size.width * -.02,
            backgroundColor: kPrimaryColor,
            title: const Text('Friends',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22)),
            leading: GestureDetector(
                onTap: () {
                  context.read<GetFriendsCubit>().getFriends(
                      userID: FirebaseAuth.instance.currentUser!.uid);
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back))),
        body: FriendsPageBody(size: size));
  }
}


