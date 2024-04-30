import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

Future<void> shareMedia(
    {required String mediaUrl, required String mediaType}) async {
  if (mediaType == 'phone_number') {
    await Share.share(mediaUrl);
  }  else {
    final url = Uri.parse(mediaUrl);
    final response = await http.get(url);
    final bytes = response.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/$mediaType';
    File(path).writeAsBytesSync(bytes);
    await Share.shareXFiles([XFile(path)]);
  }
}
