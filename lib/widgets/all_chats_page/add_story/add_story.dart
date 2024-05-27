import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_pop_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStory extends StatelessWidget {
  const AddStory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Column(
      children: [
        CircleAvatar(
            radius: size.height *.031,
            backgroundColor:
                isDark ? const Color(0xff4a4b50) : Colors.grey.withOpacity(.15),
            child: PopupMenuButton(
              offset: const Offset(0, 14),
                color: isDark ? const Color(0xff2b2c33) : Colors.white,
                icon: Icon(Icons.add,
                    color: isDark ? const Color(0xffd2d1d8) : Colors.grey),
                itemBuilder: (context) => const [
                      PopupMenuItem(child: AddStoryPopMenuButton()),
                    ])),
        SizedBox(height: size.width * .02),
        Text('Your Story',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black))
      ],
    );
  }
}
