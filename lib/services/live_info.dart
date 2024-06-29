import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class LiveInfo {
  static var appID = dotenv.env['LIVEAPPID'];
  static var appSign = dotenv.env['LIVEAPPSIGN'];
}
