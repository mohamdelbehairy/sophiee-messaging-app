import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

import '../../../cubit/auth/login/login_cubit.dart';
import '../../../cubit/user_date/image/get_image/get_image_cubit.dart';
import '../../../pages/card_three_see_all_page.dart';
import 'custom_profile_info.dart';

class ProfilePageCardOnePosts extends StatelessWidget {
  const ProfilePageCardOnePosts({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var images = context.read<GetImageCubit>();
    var isDark = context.read<LoginCubit>().isDark;

    return BlocBuilder<GetImageCubit, GetImageState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => getnav.Get.to(
              () => CardThreeSeeAllPage(
                  isDark: isDark, getImage: images, size: size),
              transition: getnav.Transition.downToUp),
          child: CustomProfileInfo(
              numberInfo: images.imageList.length.toString(),
              textInfo: 'Public Post'),
        );
      },
    );
  }
}
