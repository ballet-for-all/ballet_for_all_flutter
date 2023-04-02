import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router.gr.dart';
import 'sign_up_2_view.dart';

@RoutePage()
class SignUp2Page extends StatelessWidget {
  const SignUp2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SignUp2View(
        onKakaoLoginPressed: () => context.pushRoute(const SignUpRoute()),
        onAppleLoginPressed: () => context.pushRoute(const SignUpRoute()),
      );
}
