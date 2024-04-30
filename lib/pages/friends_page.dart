import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/widgets/friends_page/friends_page_item_one.dart';
import 'package:sophiee/widgets/friends_page/friends_page_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<GetFriendsCubit>()
        .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color(0xffd7dfd4),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text('All Friends',
            style: TextStyle(color: Colors.white, fontSize: size.width * .047)),
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          enableFeedback: false,
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: size.height * .04,
          ),
        ),
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body: BlocBuilder<GetFriendsCubit, GetFriendsState>(
        builder: (context, state) {
          if (state is GetFriendsSuccess) {
            return Column(
              children: [
                FriendsPageItemOne(friendsNumber: state.friends.length),
                FriendsPageListView(
                    itemCount: state.friends.length, friend: state.friends),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
