import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/image_model.dart';

class ShowImagePageBody extends StatelessWidget {
  const ShowImagePageBody(
      {super.key, required this.size, required this.imageModel});

  final Size size;
  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: size.width,
          child: CachedNetworkImage(
              imageUrl: imageModel.imageUrl, fit: BoxFit.cover)),
    );
  }
}