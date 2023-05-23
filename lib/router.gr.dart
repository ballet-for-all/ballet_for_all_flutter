// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:ballet_for_all_flutter/page/location/view/location_page.dart'
    as _i1;
import 'package:ballet_for_all_flutter/page/main/main_router.dart' as _i2;
import 'package:ballet_for_all_flutter/page/main/view/main_page.dart' as _i3;
import 'package:ballet_for_all_flutter/page/sign_up/sign_up_router.dart' as _i4;
import 'package:ballet_for_all_flutter/page/sign_up/view/sign_up_page.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LocationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LocationPage(),
      );
    },
    MainRouter.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
    SignUpRouter.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpRouterPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LocationPage]
class LocationRoute extends _i6.PageRouteInfo<void> {
  const LocationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MainRouterPage]
class MainRouter extends _i6.PageRouteInfo<void> {
  const MainRouter({List<_i6.PageRouteInfo>? children})
      : super(
          MainRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainRouter';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignUpRouterPage]
class SignUpRouter extends _i6.PageRouteInfo<void> {
  const SignUpRouter({List<_i6.PageRouteInfo>? children})
      : super(
          SignUpRouter.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRouter';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
