import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

class AuthGuard extends AutoRouteGuard {

  bool isFirstTime = true;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // TODO(ghrud92): 실제 로그인 여부 확인
    if (isFirstTime) {
      isFirstTime = false;
      router.push(const SignUpRouter());
    } else {
      resolver.next();
    }
  }
}
