import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../../models/group_model.dart';

class GroupsChatAppBarBody extends StatelessWidget {
  const GroupsChatAppBarBody(
      {super.key,
      required this.isDark,
      required this.groupData,
      required this.size});

  final bool isDark;
  final GroupModel groupData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    shimmerBaseColor:
                        isDark ? Colors.white12 : Colors.grey.shade300,
                    shimmerHighlightColor:
                        isDark ? Colors.white24 : Colors.grey.shade100,
                    imageUrl: groupData.groupImage!))),
        SizedBox(width: size.width * .03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: size.width * .4,
                child: Text(groupData.groupName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white, fontSize: size.width * .04))),
            SizedBox(height: size.width * .005),
            Text('${groupData.usersID.length} members',
                style: TextStyle(
                    color: Colors.white70, fontSize: size.width * .03))
          ],
        ),
      ],
    );
  }
}
