import 'package:check_in/BussinceLogic/Cubit/phone_auth/phone_auth_cubit.dart';
import 'package:check_in/Constant/strings.dart';
import 'package:check_in/Presentation/Screen/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BussinceLogic/Cubit/phone_auth/phone_auth_cubit.dart';
import 'Presentation/Screen/login_Screen.dart';
import 'Presentation/Screen/map_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) => MapScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!, child: LoginScreen()));
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!,
                child: OtpScreen(phoneNumber: phoneNumber)));
    }
  }
}
