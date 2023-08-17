import 'package:get/get.dart';

import '../location/location_pages.dart';

class SignUpPageController extends GetxController {
  //카카오로그인 클릭
  void onKakaoLoginPressed() {
    Get.toNamed(LocationPage.routeName);
  }

  //애플로그인 버튼 클릭
  void onAppleLoginPressed() {
    Get.toNamed(LocationPage.routeName);
  }
}
