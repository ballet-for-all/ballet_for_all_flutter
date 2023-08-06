import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SignUpPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  //카카오로그인 클릭
  void onKakaoLoginPressed() {
    Get.toNamed(Routes.location);
  }

  //애플로그인 버튼 클릭
  void onAppleLoginPressed() {
    Get.toNamed(Routes.location);
  }
}
