import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/utils/widget/auth/phone_number_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

class AddUserPhoneNumber extends StatefulWidget {
  const AddUserPhoneNumber(
      {super.key,
      required this.size,
      required this.phoneNumber,
      required this.onChanged,
      required this.enabled});

  final Size size;
  final TextEditingController phoneNumber;
  final Function(PhoneNumber) onChanged;
  final bool enabled;

  @override
  State<AddUserPhoneNumber> createState() => _AddUserPhoneNumberState();
}

class _AddUserPhoneNumberState extends State<AddUserPhoneNumber> {
  Color iconColor = const Color(0xffc3c5c5);
  bool disableLengthCheck = true;

  @override
  void initState() {
    super.initState();
    widget.phoneNumber.addListener(updatePhoneNumberDetails);
  }

  @override
  void dispose() {
    widget.phoneNumber.removeListener(updatePhoneNumberDetails);
    super.dispose();
  }

  void updatePhoneNumberDetails() {
    setState(() {
      iconColor = widget.phoneNumber.text.isEmpty
          ? const Color(0xffc3c5c5)
          : context.read<LoginCubit>().isDark
              ? Colors.white
              : Colors.black;
      disableLengthCheck = widget.phoneNumber.text.isEmpty ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PhoneNumberTextField(
        enabled: widget.enabled,
        phoneNumber: widget.phoneNumber,
        size: widget.size,
        hintText: 'Phone Number',
        dropDownColor: iconColor,
        disableLengthCheck: disableLengthCheck,
        onChanged: widget.onChanged,
        fillColor: const Color(0xff2b2c33).withOpacity(.035));
  }
}
