import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: SignUpRouter.page,
      children: [
        AutoRoute(path: '', page: SignUpRoute.page),
        AutoRoute(path: 'agree-terms', page: AgreeTermsRoute.page),
      ],
    ),
    AutoRoute(page: SignUp2Route.page),
  ];
}
