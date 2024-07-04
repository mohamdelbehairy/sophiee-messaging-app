import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'copy_text_state.dart';

class CopyTextCubit extends Cubit<CopyTextState> {
  CopyTextCubit() : super(CopyTextInitial());

  void copyText({required String text}) {
    final value = ClipboardData(text: text);
    Clipboard.setData(value);
    log('copied: ${value.text}');
    emit(CopyTextSuccess());
  }
}
