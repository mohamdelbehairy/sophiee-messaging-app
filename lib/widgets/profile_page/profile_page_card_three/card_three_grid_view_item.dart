import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../models/image_model.dart';
import '../../../pages/show_image/show_image_page.dart';
import 'grid_view_item_progress_indicator.dart';

class CardThreeGridViewItem extends StatelessWidget {
  const CardThreeGridViewItem(
      {super.key,
      required this.isDark,
      required this.imageModel,
      required this.size});
  final bool isDark;
  final ImageModel imageModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GestureDetector(
          onTap: () => Navigation.push(
              context, ShowImagePage(imageModel: imageModel, size: size)),
          child: CachedNetworkImage(
              imageUrl: imageModel.imageUrl,
              progressIndicatorBuilder: (context, url, progress) =>
                  GridViewItemProgressIndicator(size: size, isDark: isDark)),
        ),
      ),
    );
  }
}
