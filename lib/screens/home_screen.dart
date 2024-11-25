import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_myshopline_retailer/bloc_core/data_connection_checker/network_cubit.dart';
import 'package:ows_myshopline_retailer/core/constants.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'package:ows_myshopline_retailer/core/widgets/internet_error.dart';
import 'package:ows_myshopline_retailer/screens/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext buildContext) {
    return  BlocConsumer<NetworkCubit, NetworkState>(
      listener: (context, state) {
        if (state == NetworkState.initial) {
          CustomSnackBar.snackBar(
              context: buildContext, data: TX_OFFLINE, color: Colors.red);
        }
        else if (state == NetworkState.gained) {
          CustomSnackBar.snackBar(
              context: buildContext, data: TX_ONLINE, color: Colors.green);
        } else if (state == NetworkState.lost) {
          CustomSnackBar.snackBar(
              context: buildContext, data: TX_OFFLINE, color: Colors.red);
        }
        else {
          CustomSnackBar.snackBar(
              context: buildContext, data: 'error', color: Colors.red);
        }
      },
      builder: (context, state) {
        if (state == NetworkState.initial) {
          return InternetError(text: TX_CHECK_INTERNET);
        } else if (state == NetworkState.gained) {
          return ScreenBottomNav();
        } else if (state == NetworkState.lost) {
          return InternetError(text: TX_LOST_INTERNET);
        } else
          return InternetError(text: 'error');
      },
    );
  }
}
