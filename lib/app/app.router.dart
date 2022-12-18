// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:foodly_app/ui/views/forgot_pass/forgot_pass_view.dart' as _i4;
import 'package:foodly_app/ui/views/login/login_view.dart' as _i2;
import 'package:foodly_app/ui/views/signup/signup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const loginView = '/';

  static const signupView = '/signup-view';

  static const forgotPassView = '/forgot-pass-view';

  static const all = <String>{
    loginView,
    signupView,
    forgotPassView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i3.SignupView,
    ),
    _i1.RouteDef(
      Routes.forgotPassView,
      page: _i4.ForgotPassView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i2.LoginView(key: args.key),
        settings: data,
      );
    },
    _i3.SignupView: (data) {
      final args = data.getArgs<SignupViewArguments>(
        orElse: () => const SignupViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.SignupView(key: args.key),
        settings: data,
      );
    },
    _i4.ForgotPassView: (data) {
      final args = data.getArgs<ForgotPassViewArguments>(
        orElse: () => const ForgotPassViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.ForgotPassView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i5.Key? key;
}

class SignupViewArguments {
  const SignupViewArguments({this.key});

  final _i5.Key? key;
}

class ForgotPassViewArguments {
  const ForgotPassViewArguments({this.key});

  final _i5.Key? key;
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToLoginView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signupView,
        arguments: SignupViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPassView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPassView,
        arguments: ForgotPassViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
