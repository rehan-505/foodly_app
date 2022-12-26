// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:foodly_app/ui/views/forgot_pass/forgot_pass_view.dart' as _i4;
import 'package:foodly_app/ui/views/home/home_view.dart' as _i6;
import 'package:foodly_app/ui/views/login/login_view.dart' as _i2;
import 'package:foodly_app/ui/views/onboarding/onboarding_view.dart' as _i5;
import 'package:foodly_app/ui/views/reset_email/reset_email_view.dart' as _i7;
import 'package:foodly_app/ui/views/signup/signup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const forgotPassView = '/forgot-pass-view';

  static const onboardingView = '/';

  static const homeView = '/home-view';

  static const resetEmailView = '/reset-email-view';

  static const all = <String>{
    loginView,
    signupView,
    forgotPassView,
    onboardingView,
    homeView,
    resetEmailView,
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
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i5.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i6.HomeView,
    ),
    _i1.RouteDef(
      Routes.resetEmailView,
      page: _i7.ResetEmailView,
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SignupView(),
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
    _i5.OnboardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OnboardingView(),
        settings: data,
      );
    },
    _i6.HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.HomeView(),
        settings: data,
      );
    },
    _i7.ResetEmailView: (data) {
      final args = data.getArgs<ResetEmailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.ResetEmailView(key: args.key, email: args.email),
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

  final _i8.Key? key;
}

class ForgotPassViewArguments {
  const ForgotPassViewArguments({this.key});

  final _i8.Key? key;
}

class ResetEmailViewArguments {
  const ResetEmailViewArguments({
    this.key,
    required this.email,
  });

  final _i8.Key? key;

  final String email;
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToLoginView({
    _i8.Key? key,
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

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPassView({
    _i8.Key? key,
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

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetEmailView({
    _i8.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resetEmailView,
        arguments: ResetEmailViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
