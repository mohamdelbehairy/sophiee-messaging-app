import 'package:flutter_bloc/flutter_bloc.dart';

class AllChatsShimmerStatusCubit extends Cubit<bool> {
  AllChatsShimmerStatusCubit() : super(true);

  void setLoading(bool value) => emit(value);
}
