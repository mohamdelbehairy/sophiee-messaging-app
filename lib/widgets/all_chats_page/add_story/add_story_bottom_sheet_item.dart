import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStoryBottomSheetItem extends StatelessWidget {
  const AddStoryBottomSheetItem(
      {super.key, required this.icon, required this.text, required this.onTap});
  final IconData icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: isDark ? Colors.white : Colors.black87),
          const SizedBox(width: 16),
             Text(text,
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: size.width * .042)),
        ],
      ),
    );
  }
}
