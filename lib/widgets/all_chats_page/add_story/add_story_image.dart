import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/cubit/notification/store_notification/store_notification_cubit.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_share_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../cubit/notification/story_notification/story_notification_cubit.dart';
import '../../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../../cubit/user_date/image/store_image/store_image_cubit.dart';
import '../../../utils/methods/initial_state.dart';
import 'add_story_image/add_story_image_app_bar.dart';
import 'add_story_image/add_story_image_custom_image.dart';
import 'add_story_text_field.dart';

class AddStoryImage extends StatefulWidget {
  const AddStoryImage({super.key, required this.image});
  final File image;

  @override
  State<AddStoryImage> createState() => _AddStoryImageState();
}

class _AddStoryImageState extends State<AddStoryImage> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    context
        .read<GetFriendsCubit>()
        .getFriends(userID: FirebaseAuth.instance.currentUser!.uid);
    context.read<GetUserDataCubit>().getUserData();

    super.initState();
  }

  List<UserModel>? items;
  List<UserModel>? items2;
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final story = context.read<StoryCubit>();
    var uploadImage = context.read<UploadImageCubit>();
    var storeImage = context.read<StoreImageCubit>();
    var storyNotification = context.read<StoryNotificationCubit>();
    var storeNotification = context.read<StoreNotificationCubit>();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: addStoryImageAppBar(context),
      body: BlocListener<StoryCubit, StoryState>(
        listener: (context, state) {
          if (state is AddStorySuccess) {
            InitialState.initPickImageState(context);
          }
        },
        child: Stack(
          children: [
            AddStoryCustomImage(image: widget.image),
            AddStoryTextField(size: size, controller: controller),
            Positioned(
              bottom: size.height * .02,
              right: size.width * .02,
              child: BlocListener<GetFriendsCubit, GetFriendsState>(
                listener: (context, friendState) {
                  if (friendState is GetFriendsSuccess) {
                    items = friendState.friends;
                  }
                },
                child: BlocListener<GetUserDataCubit, GetUserDataStates>(
                  listener: (context, state) {
                    if (state is GetUserDataSuccess) {
                      items2 = state.userModel;
                      user = state.userModel.firstWhere((element) =>
                          element.userID ==
                          FirebaseAuth.instance.currentUser!.uid);
                    }
                  },
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Future.delayed(const Duration(seconds: 1), () {
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      });
                      String storyID = const Uuid().v4();
                      String storyImage = await uploadImage.uploadImage(
                          imageFile: widget.image, fieldName: 'stories_images');
                      await storeImage.storeImage(
                          imageUrl: storyImage,
                          isProfileImage: false,
                          isStoryImage: true);
                      await story.addStory(
                          imageUrl: storyImage,
                          storyID: storyID,
                          videoUrl: null,
                          storyText: controller.text);
                      await story.updateIsStory(
                          isStory: true,
                          userID: FirebaseAuth.instance.currentUser!.uid);
                      if (items != null) {
                        for (var element in items!) {
                          var data = items2!
                              .firstWhere((e) => e.userID == element.userID);

                          if (data.isStoryNotify) {
                            await storyNotification.sendStoryNotification(
                                receiverToken: data.token,
                                senderName: user!.userName,
                                senderId: user!.userID);
                          }
                          await storeNotification.storeNotification(
                              notificationID: storyID,
                              userID: data.userID,
                              notificationType: "image");
                        }
                      }
                    },
                    child: const AddStoryShareBottom(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
