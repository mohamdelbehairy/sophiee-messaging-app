import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/block/block_cubit.dart';
import 'package:sophiee/cubit/friends/friends_state.dart';
import '../../constants.dart';
import '../../cubit/follow_status/follow_status_cubit.dart';
import '../../cubit/follower/follower_cubit.dart';
import '../../cubit/friends/friends_cubit.dart';
import '../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../../models/users_model.dart';
import '../../pages/chats/chat_page.dart';
import '../../utils/initial_state.dart';
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
    var friend = context.read<FriendsCubit>();
    var updateUserData = context.read<UpdateUserDataCubit>();
    var blockUser = context.read<BlockCubit>();

    return BlocBuilder<FollowStatusCubit, bool>(
      builder: (context, isFollowing) {
        return BlocListener<FriendsCubit, FriendsState>(
          listener: (context, state) {
            if (state is DeleteFriendsSuccess) {
              InitialState.initFriendState(context);
              debugPrint('تم حذف الصداقه');
            }
          },
          child: PopupMenuButton(
              color: kPrimaryColor,
              icon: const Icon(FontAwesomeIcons.ellipsisVertical,
                  color: Colors.white, size: 25),
              itemBuilder: (context) => [
                    if (!user.isProfileLock || !isFriend)
                      if (!userData.blockUsers.contains(user.userID) &&
                          !user.blockUsers.contains(userData.userID))
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
                      if (!userData.blockUsers.contains(user.userID) &&
                          !user.blockUsers.contains(userData.userID))
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
                        onTap: () async {
                          if (userData.blockUsers.contains(user.userID)) {
                            await updateUserData.removeListUsers(
                                userID: user.userID, fieldName: 'blockUsers');
                            await blockUser.deleteBlock(userID: user.userID);
                          } else {
                            await updateUserData.addListUsers(
                                userID: user.userID, fieldName: 'blockUsers');
                            await blockUser.storeBlock(userID: user.userID);
                            await follower.deleteAllFollowerInfo(
                                followerID: user.userID);
                            await friend.deleteFriends(friendID: user.userID);
                          }
                        },
                        itemName: userData.blockUsers.contains(user.userID)
                            ? 'Unblock ${user.userName.split(' ')[0]}'
                            : 'Block ${user.userName.split(' ')[0]}',
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
                  ]),
        );
      },
    );
  }
}
