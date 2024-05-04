import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveImage({required String imageUrl}) async {
  final tempDir = await getTemporaryDirectory();
  final fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
  final path = '${tempDir.path}/$fileName';
  await Dio().download(imageUrl, path);
  await GallerySaver.saveImage(path, albumName: 'Sophiee');
}
