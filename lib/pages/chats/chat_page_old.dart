// import 'package:app/constants.dart';
// import 'package:app/cubit/chats/chats_cubit.dart';
// import 'package:app/cubit/connectivity/connectivity_cubit.dart';
// import 'package:app/cubit/get_followers/get_followers_cubit.dart';
// import 'package:app/cubit/get_following/get_following_cubit.dart';
// import 'package:app/cubit/message/message_cubit.dart';
// import 'package:app/cubit/pick_contact/pick_contact_cubit.dart';
// import 'package:app/cubit/pick_contact/pick_contact_state.dart';
// import 'package:app/models/users_model.dart';
// import 'package:app/utils/shimmer/home/all_chats/chat_page/message_page_shimmer.dart';
// import 'package:app/widgets/all_chats_page/chat_page/chat_page_app_bar_title.dart';
// import 'package:app/widgets/all_chats_page/chat_page/chat_page_body.dart';
// import 'package:app/widgets/all_chats_page/chat_page/chats_icons_app_bar_button.dart';
// import 'package:app/widgets/all_chats_page/chat_page/pick_chat_items/pick_contact_bottom_sheet.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key, required this.user});
//   final UserModel user;

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   @override
//   void initState() {
//     context.read<MessageCubit>().getMessage(receiverID: widget.user.userID);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     context.read<ChatsCubit>().chats();

//     return Scaffold(
//       backgroundColor: Colors.white,
//       key: scaffoldKey,
//       appBar: AppBar(
//         titleSpacing: size.width * -.02,
//         backgroundColor: kPrimaryColor,
//         elevation: 0,
//         leading: GestureDetector(
//             onTap: () {
//               context.read<PickContactCubit>().emit(PickContactInitial());
//               context
//                   .read<GetFollowersCubit>()
//                   .getFollowers(userID: FirebaseAuth.instance.currentUser!.uid);
//               context
//                   .read<GetFollowingCubit>()
//                   .getFollowing(userID: FirebaseAuth.instance.currentUser!.uid);
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back, size: size.height * .04)),
//         title: ChatPageAppBarTitle(user: widget.user),
//         iconTheme: IconThemeData(size: 35, color: Colors.white),
//         actions: [
//           ChatsIconsAppBarButton(icon: Icons.call),
//           ChatsIconsAppBarButton(icon: FontAwesomeIcons.video),
//           ChatsIconsAppBarButton(icon: Icons.error),
//         ],
//       ),
//       body: BlocBuilder<PickContactCubit, PickContactState>(
//         builder: (context, state) {
//           if (state is PickContactSuccess) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               showModalBottomSheet(
//                 context: context,
//                 backgroundColor: Colors.transparent,
//                 builder: (context) => PickContactBottomSheet(
//                     user: widget.user,
//                     phoneContactName: state.phoneContact.fullName!.toString(),
//                     phoneContactNumber:
//                         state.phoneContact.phoneNumber!.number.toString()),
//               );
//             });
//           }
//           return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
//             builder: (context, state) {
//               if (state == ConnectivityResult.mobile ||
//                   state == ConnectivityResult.wifi) {
//                 return ChatPageBody(user: widget.user);
//               } else {
//                 return MessagePageShimmer();
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
