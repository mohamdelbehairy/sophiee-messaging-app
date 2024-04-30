import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_pick_items/groups_chat_bottom_sheet_pick_contact_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupsChatPickContactBottomSheet extends StatelessWidget {
  const GroupsChatPickContactBottomSheet(
      {super.key,
      required this.phoneContactName,
      required this.phoneContactNumber, required this.groupModel});
  final String phoneContactName;
  final String phoneContactNumber;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    final pickContact = context.read<PickContactCubit>();
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
                              color: isDark ? Colors.white : const Color(0xff2b2c33),
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
              GroupsChatBottomSheetPickContactButton(
                  groupModel: groupModel,
                  phoneContactNumber: phoneContactNumber,
                  phoneContactName: phoneContactName),
            ],
          ),
          Positioned(
              top: size.height * .01,
              left: size.width * .01,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    pickContact.phoneContact = null;
                    pickContact.emit(PickContactInitial());
                  },
                  child: Icon(FontAwesomeIcons.xmark,
                      color: isDark ? Colors.white : Colors.black)))
        ],
      ),
    );
  }
}
