import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreSerivce extends GetxService{
  Future<SharedPreferences> init() async => await SharedPreferences.getInstance();
}