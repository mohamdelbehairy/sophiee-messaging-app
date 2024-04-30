import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultPageCardInfoItem extends StatelessWidget {
  const SearchResultPageCardInfoItem(
      {super.key, required this.value, required this.nameItem});
  final String value;
  final String nameItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Column(
      children: [
        Text(value,
            style: TextStyle(color: isDark ? Colors.white : Colors.black)),
        SizedBox(height: size.height * .005),
        Text(nameItem, style: const TextStyle(color: Colors.grey))
      ],
    );
  }
}
