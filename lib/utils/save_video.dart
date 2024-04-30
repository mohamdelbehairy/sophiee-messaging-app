import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveVideo({required String videoUel}) async {
  final tempDir = await getTemporaryDirectory();
  final fileName = 'video${DateTime.now().millisecondsSinceEpoch}.mp4';
  final path = '${tempDir.path}/$fileName';
  await Dio().download(videoUel, path);
  await GallerySaver.saveVideo(path, albumName: 'Sophiee');
}
