import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/network_error_status/network_error_status_cubit.dart';
import 'package:sophiee/utils/fetch_network_error_method.dart';

class CustomNetWorkErrorMessage extends StatefulWidget {
  const CustomNetWorkErrorMessage(
      {super.key, required this.size, required this.bottom});

  final Size size;
  final double bottom;

  @override
  State<CustomNetWorkErrorMessage> createState() =>
      _CustomNetWorkErrorMessageState();
}

class _CustomNetWorkErrorMessageState extends State<CustomNetWorkErrorMessage> {
  @override
  Widget build(BuildContext context) {
    _init(seconds: 6);
    var isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<NetworkErrorStatusCubit, bool>(
      builder: (context, state) {
        debugPrint('state: $state');
        return state
            ? Positioned(
                bottom: widget.bottom,
                child: SizedBox(
                  height: widget.size.height * .3,
                  width: widget.size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.size.width * .02, vertical: 0.0),
                    child: Card(
                      color: isDark ? const Color(0xff2b2c33) : Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: widget.size.height * .1,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/network-error.png'))),
                          ),
                          Text('Network Error',
                              style: TextStyle(
                                  color: isDark ? Colors.white : Colors.black,
                                  fontSize: widget.size.height * .03)),
                          SizedBox(height: widget.size.width * .01),
                          Text(
                              'We apologize, no activity has been detected at the moment.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: isDark ? Colors.white70 : Colors.grey,
                                  fontSize: widget.size.height * .0135,
                                  fontWeight: FontWeight.w100)),
                          Text(
                              'Please check your internet connection and try again.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: isDark ? Colors.white70 : Colors.grey,
                                  fontSize: widget.size.height * .0135,
                                  fontWeight: FontWeight.w100)),
                          SizedBox(height: widget.size.width * .02),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: widget.size.width * .06),
                            child: GestureDetector(
                              onTap: () async {
                                fetchNetworkErrorMethod(
                                    context: context, isNetwork: false);

                                _init(seconds: 6);
                              },
                              child: Text('Retry Connection',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: widget.size.height * .015,
                                      fontWeight: FontWeight.w100)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }

  _init({required int seconds}) async {
    await Future.delayed(Duration(seconds: seconds));
    _networkStatue();
  }

  _networkStatue() {
    if (mounted) {
      fetchNetworkErrorMethod(context: context, isNetwork: true);
    }
  }
}
