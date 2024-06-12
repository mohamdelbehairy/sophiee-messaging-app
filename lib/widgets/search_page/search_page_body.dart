import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_page_details.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  TextEditingController controller = TextEditingController();
  List<UserModel> list = [];
  List<UserModel> searchList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, state) {
      if (state is GetUserDataSuccess) {
        list = state.userModel;
        return SearchPageDetails(
          size: size,
          controller: controller,
          isDark: isDark,
          searchList: searchList,
          list: list,
          onTap: () {
            setState(() {
              controller.clear();
              searchList.clear();
            });
          },
          onChanged: (value) {
            setState(() {
              searchList = value.isEmpty
                  ? []
                  : list
                      .where((element) =>
                          (element.userName
                                  .toLowerCase()
                                  .contains(value.toLowerCase()) ||
                              element.emailAddress
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) &&
                          element.userID !=
                              FirebaseAuth.instance.currentUser!.uid)
                      .toList();
            });
          },
        );
      } else {
        return Container();
      }
    });
  }
}
