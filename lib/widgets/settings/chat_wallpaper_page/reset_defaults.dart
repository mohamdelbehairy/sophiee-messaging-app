import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../custom_items_two.dart';

class ChatWallPaperResetDefaults extends StatelessWidget {
  const ChatWallPaperResetDefaults(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var resetColor = context.read<UpdateUserDataCubit>();
    return CustomItemsTwo(
        color: const Color(0xffB338E0),
        icon: FontAwesomeIcons.star,
        icon2: FontAwesomeIcons.chevronRight,
        iconSize: size.width * .04,
        text: 'Reset to Defaults',
        size: size,
        textColor: isDark ? Colors.white : Colors.black,
        onTap: () async {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: kPrimaryColor,
                  content: const Text(
                      "Are you sure you want reset to defaults?",
                      style: TextStyle(color: Colors.white)),
                  actions: [
                    TextButton(
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.of(context).pop(false)),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop(false);
                        await resetColor.updateBackgrounChatField(
                            colorValue: null, imageUrl: null);
                      },
                      child: const Text("Reset",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              });
        });
  }
}
