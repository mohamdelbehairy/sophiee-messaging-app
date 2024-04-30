import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ChatPageFriendInfoShimmer extends StatelessWidget {
  const ChatPageFriendInfoShimmer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
      highlightColor: isDark ? Colors.white24 : Colors.grey.shade100,
      child: Column(
        children: [
          Container(
              height: size.width * .012,
              width: size.width * .09,
              color: Colors.white,
              margin: EdgeInsets.only(top: size.width * .01)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.width * .01),
                child: SizedBox(
                  width: size.width,
                  child: ListTile(
                    leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25))),
                    title: Row(
                      children: [
                        Container(
                          height: 8,
                          width: size.width / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Container(
                          height: 8,
                          width: size.width / 4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 80,
                      child: Container(
                        height: 40,
                        width: size.width / 5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: size.height * .04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomItemInfoCardOneShimmer(width: size.width / 8),
              CustomItemInfoCardOneShimmer(width: size.width / 8),
              CustomItemInfoCardOneShimmer(width: size.width / 8),
            ],
          ),
          SizedBox(height: size.width * .02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomItemInfoCardOneShimmer(width: size.width / 8),
              CustomItemInfoCardOneShimmer(width: size.width / 8),
              CustomItemInfoCardOneShimmer(width: size.width / 8),
            ],
          ),
          SizedBox(height: size.width * .1),
          ChatPageFriendContactInfoShimmer(size: size),
          SizedBox(height: size.height * .015),
          ChatPageFriendContactInfoShimmer(size: size),
        ],
      ),
    );
  }
}

class ChatPageFriendContactInfoShimmer extends StatelessWidget {
  const ChatPageFriendContactInfoShimmer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomItemInfoCardOneShimmer(width: size.width / 6),
              SizedBox(height: size.width * .01),
              CustomItemInfoCardOneShimmer(width: size.width / 2),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
          )
        ],
      ),
    );
  }
}
