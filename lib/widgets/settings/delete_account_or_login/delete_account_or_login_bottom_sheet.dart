import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/setting_bottom_sheet_model.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';

class DeleteAccountOrLoginBottomSheet extends StatelessWidget {
  const DeleteAccountOrLoginBottomSheet(
      {super.key, required this.settingBottomSheetModel});
  final SettingBottomSheetModel settingBottomSheetModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(settingBottomSheetModel.title,
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: settingBottomSheetModel.titleSize ?? 22)),
          const SizedBox(height: 8),
          Text(settingBottomSheetModel.body,
              style: TextStyle(
                  color: isDark
                      ? const Color(0xffc0c0c0)
                      : const Color(0xff8e9293),
                  fontWeight: FontWeight.normal,
                  fontSize: 14)),
          const SizedBox(height: 12),
          CustomBottom(
              text: settingBottomSheetModel.buttonName,
              textSize: 18,
              padding: const EdgeInsets.all(6),
              colorBottom: kPrimaryColor,
              colorText: Colors.white,
              onPressed: settingBottomSheetModel.onTap,
              borderRadius: BorderRadius.circular(12),
              width: size.width),
          const SizedBox(height: 4),
          CustomBottom(
              text: 'no',
              textSize: 18,
              colorBottom: Colors.transparent,
              colorText: isDark ? Colors.white : Colors.black,
              onPressed: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(12),
              width: size.width),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
