import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_popover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popover/popover.dart';

class AddStory extends StatelessWidget {
  const AddStory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => showPopover(
            height: size.height * .15,
            width: size.height * .25,
            backgroundColor: isDark ? const Color(0xff2b2c33) : Colors.white,
            direction: PopoverDirection.bottom,
            context: context,
            bodyBuilder: (context) => const AddStoryPopover(),
          ),
          child: CircleAvatar(
            radius: size.width * .073,
            backgroundColor: Colors.grey.withOpacity(.1),
            child: const Icon(Icons.add),
          ),
        ),
        SizedBox(height: size.width * .01),
        Text(
          'Your Story',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black),
        )
      ],
    );
  }
}
