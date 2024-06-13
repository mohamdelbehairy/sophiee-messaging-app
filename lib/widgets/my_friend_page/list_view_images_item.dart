import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

import '../../cubit/user_date/image/get_image/get_image_cubit.dart';
import '../../models/image_model.dart';
import '../../pages/show_image/show_image_page.dart';

class ListViewImagesItem extends StatelessWidget {
  const ListViewImagesItem(
      {super.key,
      required this.isDark,
      required this.getImage,
      required this.size,
      required this.imageModel});

  final bool isDark;
  final GetImageCubit getImage;
  final Size size;
  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getnav.Get.to(() => ShowImagePage(imageModel: imageModel, size: size),
            transition: getnav.Transition.downToUp);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: FancyShimmerImage(
            boxFit: BoxFit.cover,
            shimmerBaseColor: isDark ? Colors.white12 : Colors.grey.shade300,
            shimmerHighlightColor:
                isDark ? Colors.white24 : Colors.grey.shade100,
            imageUrl: imageModel.imageUrl,
            height: size.height * .15,
            width: size.height * .15),
      ),
    );
  }
}
