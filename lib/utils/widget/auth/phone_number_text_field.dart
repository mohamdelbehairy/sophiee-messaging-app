import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

import '../../../constants.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField(
      {super.key,
      required this.size,
      required this.hintText,
      required this.dropDownColor,
      this.phoneNumber,
      required this.disableLengthCheck,
      required this.onChanged,
      required this.fillColor,
      required this.enabled});
  final Size size;
  final String hintText;
  final Color dropDownColor;
  final TextEditingController? phoneNumber;
  final bool disableLengthCheck;
  final Function(PhoneNumber) onChanged;
  final Color fillColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Padding(
      padding: EdgeInsets.only(bottom: size.width * .045),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(size.width * .02),
          child: IntlPhoneField(
              enabled: enabled,
              flagsButtonPadding: EdgeInsets.only(left: !enabled ? 28 : 0),
              onChanged: onChanged,
              initialCountryCode: 'EG',
              disableLengthCheck: disableLengthCheck,
              controller: phoneNumber,
              dropdownIcon: Icon(Icons.expand_more, color: dropDownColor),
              dropdownTextStyle: TextStyle(color: dropDownColor),
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: size.width * .035),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: const Color(0xffc3c5c5),
                      fontWeight: FontWeight.w100,
                      fontSize: size.width * .035),
                  filled: true,
                  fillColor: isDark ? messageFriendColorDarkMode : fillColor))),
    );
  }
}
