import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

import '../../../../constants.dart';

class NoHighLighMessages extends StatelessWidget {
  const NoHighLighMessages({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(noHighlightMessages,
                height: size.height * .15, width: size.width * .55),
            Padding(
              padding: EdgeInsets.only(left: size.width * .055),
              child: Text('No messages found yet.',
                  style: TextStyle(
                      color: isDark ? Colors.white: Colors.black,
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.normal)),
            )
          ],
        ),
      ],
    );
  }
}
