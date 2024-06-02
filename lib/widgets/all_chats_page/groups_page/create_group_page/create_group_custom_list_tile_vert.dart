import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_page_list_tile.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CreateGroupCustomLIstTileVert extends StatelessWidget {
  const CreateGroupCustomLIstTileVert({
    super.key,
    required this.userData,
    required this.widget,
    required this.isSelected,
    required this.selectedFriends,
  });

  final UserModel userData;
  final CreateGroupListTile widget;
  final bool isSelected;
  final GroupsMemberSelectedCubit selectedFriends;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: !userData.isBioAndNickName ? 8 : 0.0),
            child: Text(userData.userName,
                style: TextStyle(
                    color: widget.isDark ? Colors.white : Colors.black)),
          ),
          Container(
            height: widget.size.height * .022,
            width: widget.size.width * .05,
            margin: EdgeInsets.only(top: widget.size.width * .02),
            color: isSelected &&
                    selectedFriends
                        .getGroupsMemberSelectedFriendsList.isNotEmpty
                ? kPrimaryColor
                : Colors.grey,
            child: isSelected &&
                    selectedFriends
                        .getGroupsMemberSelectedFriendsList.isNotEmpty
                ? Icon(Icons.done,
                    size: widget.size.height * .022, color: Colors.white)
                : Container(),
          )
        ],
      ),
      subtitle: Text(
          userData.isBioAndNickName
              ? userData.nickName.isNotEmpty
                  ? userData.nickName
                  : userData.bio
              : '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey)),
      leading: CircleAvatar(
        radius: widget.size.height * .025,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FancyShimmerImage(
              boxFit: BoxFit.cover,
              shimmerBaseColor:
                  widget.isDark ? Colors.white12 : Colors.grey.shade300,
              shimmerHighlightColor:
                  widget.isDark ? Colors.white24 : Colors.grey.shade100,
              imageUrl: userData.isProfilePhotos
                  ? userData.profileImage
                  : defaultProfileImageUrl),
        ),
      ),
    );
  }
}
