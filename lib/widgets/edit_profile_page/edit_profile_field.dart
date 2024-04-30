import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/edit_profile_page/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileField extends StatelessWidget {
  const EditProfileField(
      {super.key,
      required this.fieldName,
      required this.fieldValue,
      required this.onTap});
  final String fieldName;
  final String fieldValue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.width * .05),
          child: Row(
            children: [
              Text(
                fieldName,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: size.width * .04),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsets.only(right: size.width * .04),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * .012),
                      child: Text(
                        textAlign: TextAlign.end,
                        fieldValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: size.height * .018,
                            color: isDark ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * .002),
        const CustomDivider()
      ],
    );
  }
}
