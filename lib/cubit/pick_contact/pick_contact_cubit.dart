import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_state.dart';

class PickContactCubit extends Cubit<PickContactState> {
  PickContactCubit() : super(PickContactInitial());

  PhoneContact? phoneContact;
  Future<void> pickContact() async {
    try {
      bool permission = await FlutterContactPicker.requestPermission();
      if (permission) {
        if (await FlutterContactPicker.hasPermission()) {
          phoneContact = await FlutterContactPicker.pickPhoneContact();
          if (phoneContact != null) {
            emit(PickContactSuccess(phoneContact: phoneContact!));
          }
        }
      }
    } catch (e) {
      emit(PickContactFailure(errorMessage: e.toString()));
      debugPrint('error from pick contact cubit: ${e.toString()}');
    }
  }
}
