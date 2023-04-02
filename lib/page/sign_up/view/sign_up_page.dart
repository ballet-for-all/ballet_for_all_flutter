import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router.gr.dart';
import 'sign_up_view.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SignUpView(
        onKakaoLoginPressed: () => context.pushRoute(const SignUp2Route()),
        onAppleLoginPressed: () => context.pushRoute(const SignUp2Route()),
      );
}
