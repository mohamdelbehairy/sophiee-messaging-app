import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class CallInfo {
  static var appID = dotenv.env['CALLAPPID'];
  static var appSign = dotenv.env['CALLAPPSIGN'];
}
