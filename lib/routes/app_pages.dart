import 'package:get/route_manager.dart';

import '../page/academy/academy_binding.dart';
import '../page/academy/academy_page.dart';
import '../page/location/location_binding.dart';
import '../page/location/location_pages.dart';
import '../page/main/main_binding.dart';
import '../page/main/main_pages.dart';
import '../page/sign_up/sign_up_binding.dart';
import '../page/sign_up/sign_up_pages.dart';

class AppPages {
  static const initialPage = SignUpPage.routeName;

  static final routes = [
    GetPage(
        name: MainPage.routeName,
        page: () => const MainPage(),
        binding: MainBinding()),
    GetPage(
        name: SignUpPage.routeName,
        page: () => const SignUpPage(),
        binding: SignUpBinding()),
    GetPage(
        name: LocationPage.routeName,
        page: () => const LocationPage(),
        binding: LocationBinding()),
    GetPage(
        name: AcademyPage.routeName,
        page: () => const AcademyPage(),
        binding: AcademyBinding()),
  ];
}
