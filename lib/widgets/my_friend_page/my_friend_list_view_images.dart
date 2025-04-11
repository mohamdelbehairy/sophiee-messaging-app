import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/image/get_image/get_image_cubit.dart';
import 'package:sophiee/models/users_model.dart';

import 'list_view_images_item.dart';

class MyFriendListViewImages extends StatelessWidget {
  const MyFriendListViewImages(
      {super.key, required this.size, required this.user});

  final Size size;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    var getImage = context.read<GetImageCubit>();
    getImage.getImage(userID: user.userID);

    return SizedBox(
      height:
          getImage.imageList.isNotEmpty ? size.height * .15 : size.height * .12,
      child: BlocBuilder<GetImageCubit, GetImageState>(
        builder: (context, state) {
          if (getImage.imageList.isNotEmpty) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: getImage.imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 16 : 12),
                      child: ListViewImagesItem(
                          isDark: isDark,
                          getImage: getImage,
                          size: size,
                          imageModel: getImage.imageList[index]));
                });
          } else {
            return Text('no images here yet',
                style: TextStyle(color: isDark ? Colors.white60 : Colors.grey));
          }
        },
      ),
    );
  }
}
