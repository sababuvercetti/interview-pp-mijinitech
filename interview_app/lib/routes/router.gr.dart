// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../UI/auth/login_page.dart' as _i1;
import '../UI/auth/reset_password_page.dart' as _i3;
import '../UI/auth/signup_page.dart' as _i2;
import '../UI/home/home_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SignUpPage());
    },
    ResetPasswordRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ResetPasswordPage());
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i4.HomePage(key: args.key, userCredential: args.userCredential));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LoginRoute.name, path: '/'),
        _i5.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i5.RouteConfig(ResetPasswordRoute.name, path: '/reset-password-page'),
        _i5.RouteConfig(HomeRoute.name, path: '/home-page')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.ResetPasswordPage]
class ResetPasswordRoute extends _i5.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password-page');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i6.Key? key, required _i7.UserCredential userCredential})
      : super(HomeRoute.name,
            path: '/home-page',
            args: HomeRouteArgs(key: key, userCredential: userCredential));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.userCredential});

  final _i6.Key? key;

  final _i7.UserCredential userCredential;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, userCredential: $userCredential}';
  }
}
