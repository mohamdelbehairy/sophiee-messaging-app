import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkErrorStatusCubit extends Cubit<bool> {
  NetworkErrorStatusCubit() : super(false);

  void networkErrorStatus(bool value) async {
    if (value == true) {
      await Future.delayed(const Duration(seconds: 6));
    } else {
      await Future.delayed(const Duration(microseconds: 10));
    }
    emit(value);
  }
}
