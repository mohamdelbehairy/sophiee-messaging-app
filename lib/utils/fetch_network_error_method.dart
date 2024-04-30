import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/network_error_status/network_error_status_cubit.dart';

void fetchNetworkErrorMethod(
      {required BuildContext context, required bool isNetwork}) {
    context.read<NetworkErrorStatusCubit>().networkErrorStatus(isNetwork);
  }