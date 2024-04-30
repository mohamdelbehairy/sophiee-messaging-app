import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/search_result/search_result_page_body_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultCardListTile extends StatelessWidget {
  const SearchResultCardListTile(
      {super.key, required this.user, required this.userData});
  final UserModel user;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            user.userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: size.height * .02),
          ),
          SearchResultPageBodyBottom(user: user, userData: userData),
        ],
      ),
      leading: CircleAvatar(
        radius: size.width * .06,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(user.profileImage),
      ),
      subtitle: Text(user.bio,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey)),
    );
  }
}
