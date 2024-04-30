import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultPageCardContact extends StatelessWidget {
  const SearchResultPageCardContact(
      {super.key,
      required this.contactName,
      required this.contactValue,
      required this.color,
      required this.icon});
  final String contactName;
  final String contactValue;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contactName,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              Text(
                contactValue,
                style: TextStyle(
                  color: isDark ? Colors.white54 : Colors.grey,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: size.height * .018,
            backgroundColor: color,
            child: Icon((icon), color: Colors.white, size: size.height * .018),
          )
        ],
      ),
    );
  }
}
