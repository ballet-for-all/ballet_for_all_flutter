import 'package:auto_route/auto_route.dart';

import 'auth_guard.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/sign-up',
      page: SignUpRouter.page,
      children: [
        AutoRoute(path: '', page: SignUpRoute.page),
        AutoRoute(path: 'location', page: LocationRoute.page),
      ],
    ),
    AutoRoute(
      path: '/academies',
      initial: true,
      page: MainRouter.page,
      guards: [AuthGuard()],
      children: [
        AutoRoute(path: '', page: MainRoute.page),
        AutoRoute(path: ':id', page: AcademyRoute.page),
      ],
    ),
  ];
}
