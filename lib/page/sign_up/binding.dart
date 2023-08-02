import 'package:ballet_for_all_flutter/page/sign_up/controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SignUpPageController());
  }
}