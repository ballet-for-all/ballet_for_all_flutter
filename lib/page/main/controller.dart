import 'package:get/get.dart';

import '../../firebase/firestore_academies/firestore_academies_collection.dart';
import '../../repository/academy/academy.dart';
import '../../repository/academy/academy_repository.dart';

class MainController extends GetxController{

  final mainRepository = Get.put(AcademyRepository());
  RxList<Academy> list = <Academy>[].obs;
  
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    print('list의값 ${await mainRepository.listAcademies()}');
    list.value =  await mainRepository.listAcademies();
  }
  
}