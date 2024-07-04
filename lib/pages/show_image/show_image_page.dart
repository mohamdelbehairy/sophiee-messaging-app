import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/image/delete_image/delete_image_cubit.dart';

import '../../models/image_model.dart';
import '../../widgets/show_image_page/show_image_page_body.dart';
import '../../widgets/show_image_page/show_image_page_pop_menu_button.dart';

class ShowImagePage extends StatelessWidget {
  const ShowImagePage(
      {super.key, required this.imageModel, required this.size});
  final ImageModel imageModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteImageCubit, DeleteImageState>(
      listener: (context, state) {
        if (state is DeleteImageSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            titleSpacing: size.width * -.015,
            title: Text(
                imageModel.isProfileImage ? 'Profile Image' : 'Story Image',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
            actions: [
              ShowImagePagePopMenuButton(size: size, imageModel: imageModel),
            ]),
        body: ShowImagePageBody(size: size, imageModel: imageModel),
      ),
    );
  }
}
