import 'package:fluttercontactpicker/fluttercontactpicker.dart';

abstract class PickContactState {}

final class PickContactInitial extends PickContactState {}

final class PickContactSuccess extends PickContactState {
  final PhoneContact phoneContact;

  PickContactSuccess({required this.phoneContact});
}

final class PickContactFailure extends PickContactState {
  final String errorMessage;

  PickContactFailure({required this.errorMessage});
}
