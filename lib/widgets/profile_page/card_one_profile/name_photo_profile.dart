import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_page/photo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNamePhotoProfile extends StatefulWidget {
  const CustomNamePhotoProfile(
      {super.key, required this.onTap, required this.user});
  final Function() onTap;
  final UserModel user;

  @override
  State<CustomNamePhotoProfile> createState() => _CustomNamePhotoProfileState();
}

class _CustomNamePhotoProfileState extends State<CustomNamePhotoProfile> {
  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomPhotoProfile(user: widget.user),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    _truncateText(widget.user.userName, 20),
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: size.width * .042,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.user.nickName,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Icon(
            Icons.manage_accounts,
            color:
                context.read<LoginCubit>().isDark ? Colors.white : Colors.black,
            size: 28,
          ),
        )
      ],
    );
  }
}
