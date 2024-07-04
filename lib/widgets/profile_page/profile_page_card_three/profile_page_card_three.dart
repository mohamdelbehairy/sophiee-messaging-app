import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/image/get_image/get_image_cubit.dart';

import 'profile_page_card_three_body.dart';

class ProfilePageCardThree extends StatelessWidget {
  const ProfilePageCardThree({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    var getImage = context.read<GetImageCubit>();

    return Container(
        height: size.height * .3,
        width: size.width,
        decoration: const BoxDecoration(color: Colors.transparent, boxShadow: [
          BoxShadow(blurRadius: 0, color: Colors.transparent),
        ]),
        child: ProfilePageCardThreeBody(
            isDark: isDark, size: size, getImage: getImage));
  }
}
