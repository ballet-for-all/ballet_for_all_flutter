import 'package:get/route_manager.dart';
import '../page/location/binding.dart';
import '../page/location/pages.dart';
import '../page/main/binding.dart';
import '../page/main/pages.dart';
import '../page/sign_up/binding.dart';
import '../page/sign_up/pages.dart';
import 'app_routes.dart';

class AppPages {
  static const initialPage = Routes.signup;

  static final routes = [
    GetPage(
        name: Routes.splash, page: () => MainView(), binding: MainBinding()),
    GetPage(
        name: Routes.signup,
        page: () => const SignUpView(),
        binding: SignUpBinding()),
    GetPage(
        name: Routes.location,
        page: () => const LocationPage(),
        binding: LocationBinding()),
  ];
}
