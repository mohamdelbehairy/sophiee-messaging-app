import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/is_friend/is_friend_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/search_result/search_result_page_body.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    context.read<IsFriendCubit>().isFriend();
    return Scaffold(
      body: SearchResultBogy(user: user),
    );
  }
}
