import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddUserDateOfBirth extends StatefulWidget {
  const AddUserDateOfBirth(
      {super.key,
      required this.size,
      required this.dateOfBirth,
      required this.enabled});

  final Size size;
  final TextEditingController dateOfBirth;
  final bool enabled;

  @override
  State<AddUserDateOfBirth> createState() => _AddUserDateOfBirthState();
}

class _AddUserDateOfBirthState extends State<AddUserDateOfBirth> {
  Color iconColor = const Color(0xffc3c5c5);

  @override
  void initState() {
    super.initState();
    widget.dateOfBirth.addListener(updateIconColor);
  }

  @override
  void dispose() {
    widget.dateOfBirth.removeListener(updateIconColor);
    super.dispose();
  }

  void updateIconColor() {
    setState(() {
      iconColor = widget.dateOfBirth.text.isEmpty
          ? const Color(0xffc3c5c5)
          : context.read<LoginCubit>().isDark
              ? Colors.white
              : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AddUserTextField(
      enabled: false,
      size: widget.size,
      textInputType: TextInputType.number,
      iconColor: iconColor,
      controller: widget.dateOfBirth,
      hintText: 'Date of Birth',
      suffixIcon: Icon(Icons.calendar_month,
          size: widget.size.width * .05, color: iconColor),
      onTap: () {
        if (widget.enabled) {
          showDatePicker(
                  // barrierColor: Colors.amber,
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2030))
              .then((value) {
            if (value != null) {
              DateFormat format = DateFormat('MM-dd-yyyy');
              String formattedDate = format.format(value);
              widget.dateOfBirth.text = formattedDate;
            }
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "date of birth is required";
        } else {
          return null;
        }
      },
    );
  }
}
