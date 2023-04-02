// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:ballet_for_all_flutter/page/sign_up/view/sign_up_2_page.dart'
    as _i2;
import 'package:ballet_for_all_flutter/page/sign_up/view/sign_up_page.dart'
    as _i1;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SignUpRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SignUpPage(),
      );
    },
    SignUp2Route.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignUp2Page(),
      );
    },
  };
}

/// generated route for
/// [_i1.SignUpPage]
class SignUpRoute extends _i3.PageRouteInfo<void> {
  const SignUpRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignUp2Page]
class SignUp2Route extends _i3.PageRouteInfo<void> {
  const SignUp2Route({List<_i3.PageRouteInfo>? children})
      : super(
          SignUp2Route.name,
          initialChildren: children,
        );

  static const String name = 'SignUp2Route';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
