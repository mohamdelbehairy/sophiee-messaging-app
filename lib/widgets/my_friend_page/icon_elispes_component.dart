import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import '../../constants.dart';
import '../../cubit/follow_status/follow_status_cubit.dart';
import '../../cubit/follower/follower_cubit.dart';
import '../../models/users_model.dart';
import '../../pages/chats/chat_page.dart';
import '../../utils/widget/flutter_toast_widget.dart';
import '../../utils/widget/media/save_image.dart';
import '../../utils/widget/media/share_media.dart';
import '../../utils/widget/pop_menu_info_item.dart';

class IconElispesComponent extends StatelessWidget {
  const IconElispesComponent(
      {super.key,
      required this.user,
      required this.size,
      required this.follower,
      required this.userData,
      required this.isFriend});

  final UserModel user;
  final Size size;
  final FollowerCubit follower;
  final UserModel userData;
  final bool isFriend;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowStatusCubit, bool>(
      builder: (context, isFollowing) {
        return PopupMenuButton(
            color: kPrimaryColor,
            icon: const Icon(FontAwesomeIcons.ellipsisVertical,
                color: Colors.white, size: 25),
            itemBuilder: (context) => [
                  if (!user.isProfileLock || !isFriend)
                    groupsInfoPopMenuItem(
                        onTap: () async {
                          await shareMedia(
                              mediaUrl: user.profileImage,
                              mediaType: 'image.jpg');
                        },
                        itemName: 'Share image',
                        size: size,
                        icon: Icons.share_outlined),
                  if (!user.isProfileLock || !isFriend)
                    groupsInfoPopMenuItem(
                        onTap: () async {
                          await saveImage(imageUrl: user.profileImage);
                          FlutterToastWidget.showToast(
                              msg: "Image saved successfully");
                        },
                        itemName: 'Save to gallery',
                        size: size,
                        icon: Icons.save_alt_outlined),
                  groupsInfoPopMenuItem(
                      onTap: () async {},
                      itemName: 'Block ${user.userName.split(' ')[0]}',
                      size: size,
                      icon: Icons.block),
                  if (isFriend)
                    groupsInfoPopMenuItem(
                        onTap: () {
                          getnav.Get.to(() => ChatPage(userID: user.userID),
                              transition: getnav.Transition.rightToLeft);
                        },
                        itemName: 'Start Chat',
                        size: size,
                        icon: Icons.chat_outlined),
                  if (isFriend)
                    groupsInfoPopMenuItem(
                        onTap: () async {
                          if (isFollowing) {
                            await follower.deleteFollower(
                                followerID: user.userID);
                          } else {
                            follower.addFollower(
                                followerID: user.userID,
                                userName: user.userName,
                                profileImage: user.profileImage,
                                userID: user.userID,
                                emailAddress: user.emailAddress,
                                isFollowing: !isFollowing,
                                meUserName: userData.userName,
                                meProfileImage: userData.profileImage,
                                meEmailAddress: userData.emailAddress);
                          }
                        },
                        itemName: isFollowing
                            ? 'Remove ${user.userName.split(' ')[0]}'
                            : 'Add ${user.userName.split(' ')[0]}',
                        size: size,
                        icon: isFollowing
                            ? Icons.group_remove_outlined
                            : Icons.group_outlined),
                ]);
      },
    );
  }
}
