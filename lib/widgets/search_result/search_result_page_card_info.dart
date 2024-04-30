// import 'package:app/cubit/auth/login/login_cubit.dart';
// import 'package:app/cubit/get_followers/get_followers_cubit.dart';
// import 'package:app/cubit/get_followers/get_followers_state.dart';
// import 'package:app/cubit/get_following/get_following_cubit.dart';
// import 'package:app/cubit/get_following/get_following_state.dart';
// import 'package:app/models/users_model.dart';
// import 'package:app/widgets/search_result/search_result_page_card_info_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchResultPageCardInfo extends StatelessWidget {
//   const SearchResultPageCardInfo({super.key, required this.user});
//   final UserModel user;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isDark = context.read<LoginCubit>().isDark;
//     var follower = context.read<GetFollowersCubit>();
//     var following = context.read<GetFollowingCubit>();

//     return Container(
//       height: size.height * .1,
//       width: size.width,
//       color: Colors.grey.withOpacity(isDark ? .05 : .09),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SearchResultPageCardInfoItem(
//                   value: '532', nameItem: 'Public Post'),
//               BlocBuilder<GetFollowersCubit, GetFollowersState>(
//                 builder: (context, state) {
//                   if (state is GetFollowersSuccess) {
//                     return SearchResultPageCardInfoItem(
//                         value: '${follower.followersList.length}',
//                         nameItem: 'Followers');
//                   } else {
//                     return SearchResultPageCardInfoItem(
//                         value: '0', nameItem: 'Followers');
//                   }
//                 },
//               ),
//               BlocBuilder<GetFollowingCubit, GetFollowingState>(
//                 builder: (context, state) {
//                   if (state is GetFollowingSuccess) {
//                     return SearchResultPageCardInfoItem(
//                         value: '${following.followingList.length}',
//                         nameItem: 'Following');
//                   } else {
//                     return SearchResultPageCardInfoItem(
//                         value: '0', nameItem: 'Following');
//                   }
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
