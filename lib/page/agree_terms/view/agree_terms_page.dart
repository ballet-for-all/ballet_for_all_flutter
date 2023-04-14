import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../router.gr.dart';
import 'agree_terms_view.dart';

@RoutePage()
class AgreeTermsPage extends StatelessWidget {
  const AgreeTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AgreeTermsView(
        onSignUpClicked: () =>
            AutoRouter.of(context).push(const LocationRoute()),
      );
}
