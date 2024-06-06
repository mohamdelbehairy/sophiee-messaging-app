import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;

import '../../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../../models/live_model.dart';
import '../../../models/users_model.dart';
import '../../../pages/story/live_page.dart';
import 'add_story_pop_menu_item.dart';

class AddStoryLive extends StatefulWidget {
  const AddStoryLive({super.key});

  @override
  State<AddStoryLive> createState() => _AddStoryLiveState();
}

class _AddStoryLiveState extends State<AddStoryLive> {
  UserModel? user;

  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserDataCubit, GetUserDataStates>(
      listener: (context, state) {
        if (state is GetUserDataSuccess) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            user = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
          }
        }
      },
      child: AddStoryPopoverItem(
          text: 'live',
          icon: FontAwesomeIcons.youtube,
          onTap: () {
            log('userName: ${user!.userName}');
            Navigator.pop(context);
            if (user != null) {
              getnav.Get.to(
                  () => LivePage(
                      liveModel: LiveModel(
                          isHost: true,
                          liveID: user!.userID,
                          userID: user!.userID,
                          userName: user!.userName)),
                  transition: getnav.Transition.downToUp);
            }
          }),
    );
  }
}
