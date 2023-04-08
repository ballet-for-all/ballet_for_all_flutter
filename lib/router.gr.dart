// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:ballet_for_all_flutter/page/agree_terms/view/agree_terms_page.dart'
    as _i3;
import 'package:ballet_for_all_flutter/page/sign_up/sign_up_router.dart' as _i4;
import 'package:ballet_for_all_flutter/page/sign_up/view/sign_up_2_page.dart'
    as _i2;
import 'package:ballet_for_all_flutter/page/sign_up/view/sign_up_page.dart'
    as _i1;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SignUpRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SignUpPage(),
      );
    },
    SignUp2Route.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignUp2Page(),
      );
    },
    AgreeTermsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AgreeTermsPage(),
      );
    },
    SignUpRouter.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpRouterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignUp2Page]
class SignUp2Route extends _i5.PageRouteInfo<void> {
  const SignUp2Route({List<_i5.PageRouteInfo>? children})
      : super(
          SignUp2Route.name,
          initialChildren: children,
        );

  static const String name = 'SignUp2Route';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AgreeTermsPage]
class AgreeTermsRoute extends _i5.PageRouteInfo<void> {
  const AgreeTermsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AgreeTermsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgreeTermsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignUpRouterPage]
class SignUpRouter extends _i5.PageRouteInfo<void> {
  const SignUpRouter({List<_i5.PageRouteInfo>? children})
      : super(
          SignUpRouter.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRouter';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
