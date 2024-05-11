import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '../../../../models/group_model.dart';
import 'groups_cover_image_online_state.dart';

class GroupsCoverImage extends StatelessWidget {
  const GroupsCoverImage(
      {super.key,
      required this.groupModel,
      required this.isDark,
      required this.size});
  final GroupModel groupModel;
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
            radius: size.height * .035,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    shimmerBaseColor:
                        isDark ? Colors.white12 : Colors.grey.shade300,
                    shimmerHighlightColor:
                        isDark ? Colors.white24 : Colors.grey.shade100,
                    imageUrl: groupModel.groupImage!))),
        GroupsCoverImageOnlineState(
            groupModel: groupModel, size: size, isDark: isDark)
      ],
    );
  }
}

