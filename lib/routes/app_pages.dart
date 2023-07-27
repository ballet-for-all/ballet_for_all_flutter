import 'package:get/route_manager.dart';


import '../page/location1/binding.dart';
import '../page/location1/pages.dart';
import '../page/main/view/main_page.dart';
import 'app_routes.dart';

class AppPages{
  static const initialPage = Routes.location;


  static final routes = [
    GetPage(name: Routes.splash, page: () => MainPage()),
    GetPage(name: Routes.location, page: () => LocationPage1(),binding: LocationBinding()),
  ];

}