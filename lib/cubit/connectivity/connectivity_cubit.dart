import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<ConnectivityResult> {
  ConnectivityCubit() : super(ConnectivityResult.none) {
    checkConnectivity();
  }

  void checkConnectivity() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      emit(result);
    });
  }
}
