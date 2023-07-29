// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:ballet_for_all_flutter/page/academy/view/academy_page.dart'
    as _i2;
import 'package:ballet_for_all_flutter/page/location/view/location_page.dart'
    as _i1;
import 'package:ballet_for_all_flutter/page/main/main_router.dart' as _i3;
import 'package:ballet_for_all_flutter/page/main/view/main_page.dart' as _i4;
import 'package:ballet_for_all_flutter/page/sign_up/sign_up_router.dart' as _i5;
import 'package:ballet_for_all_flutter/page/sign_up/view/sign_up_page.dart'
    as _i6;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LocationRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LocationPage(),
      );
    },
    AcademyRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AcademyRouteArgs>(
          orElse: () => AcademyRouteArgs(id: pathParams.getString('id')));
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AcademyPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
    MainRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainPage(),
      );
    },
    SignUpRouter.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpRouterPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LocationPage]
class LocationRoute extends _i7.PageRouteInfo<void> {
  const LocationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AcademyPage]
class AcademyRoute extends _i7.PageRouteInfo<AcademyRouteArgs> {
  AcademyRoute({
    required String id,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AcademyRoute.name,
          args: AcademyRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'AcademyRoute';

  static const _i7.PageInfo<AcademyRouteArgs> page =
      _i7.PageInfo<AcademyRouteArgs>(name);
}

class AcademyRouteArgs {
  const AcademyRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final _i8.Key? key;

  @override
  String toString() {
    return 'AcademyRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i3.MainRouterPage]
class MainRouter extends _i7.PageRouteInfo<void> {
  const MainRouter({List<_i7.PageRouteInfo>? children})
      : super(
          MainRouter.name,
          initialChildren: children,
        );

  static const String name = 'MainRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpRouterPage]
class SignUpRouter extends _i7.PageRouteInfo<void> {
  const SignUpRouter({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpRouter.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRouter';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
