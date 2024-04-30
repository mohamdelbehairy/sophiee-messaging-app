import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPhotoProfile extends StatelessWidget {
  const CustomPhotoProfile({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isDark = context.read<LoginCubit>().isDark;

    return CircleAvatar(
      radius: size.height * .028,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(size.height * .035),
          child: FancyShimmerImage(
              boxFit: BoxFit.cover,
              shimmerBaseColor: isDark ? Colors.white12 : Colors.grey.shade300,
              shimmerHighlightColor:
                  isDark ? Colors.white24 : Colors.grey.shade100,
              imageUrl: user.profileImage)),
    );
  }
}
