import 'package:sophiee/cubit/auth/login/login_cubit.dart';

import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_contact_bottom_sheet_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/initial_state.dart';

class PickContactBottomSheet extends StatelessWidget {
  const PickContactBottomSheet(
      {super.key,
      required this.phoneContactName,
      required this.phoneContactNumber,
      required this.user});
  final String phoneContactName;
  final String phoneContactNumber;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;

    String formattedPhoneNumber = phoneContactNumber.startsWith('+2')
        ? '+2${phoneContactNumber.substring(2, 3)} ${phoneContactNumber.substring(3, 6)} ${phoneContactNumber.substring(7)}'
        : '+2${phoneContactNumber.substring(0, 1)} ${phoneContactNumber.substring(1, 4)} ${phoneContactNumber.substring(4)}';

    return Container(
      height: size.height * .25,
      width: size.width,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff2b2c33) : Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(size.width * .04),
          topLeft: Radius.circular(size.width * .04),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: size.width * .01),
                      child: Text(phoneContactName,
                          style: TextStyle(
                              color: isDark
                                  ? Colors.white
                                  : const Color(0xff2b2c33),
                              fontSize: size.width * .05,
                              fontWeight: FontWeight.normal))),
                  Text(formattedPhoneNumber,
                      style: TextStyle(
                        color: isDark
                            ? Colors.grey
                            : const Color(0xff2b2c33).withOpacity(.3),
                      )),
                ],
              ),
              PickContactBottomSheetButton(
                  phoneContactName: phoneContactName,
                  phoneContactNumber: phoneContactNumber,
                  replayContactMessage: phoneContactNumber,
                  user: user)
            ],
          ),
          Positioned(
              top: size.height * .01,
              left: size.width * .01,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    InitialState.initPickContactState(context);
                  },
                  child: Icon(FontAwesomeIcons.xmark,
                      color: isDark ? Colors.white : Colors.black)))
        ],
      ),
    );
  }
}
