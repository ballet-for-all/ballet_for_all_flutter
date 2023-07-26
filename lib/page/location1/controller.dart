import 'package:get/get.dart';

import '../../repository/city/block.dart';
import '../../repository/city/city.dart';
import '../../repository/city/district.dart';
import '../../repository1/location_repository.dart';

class LocationController extends GetxController {
  final repository = Get.put(LocationRepository());
  final cities = <City>[].obs;
  final districts = <District>[].obs;
  final blocks = <Block>[].obs;
  RxInt selectedCity = 0.obs;
  RxInt selectedDistrict = 0.obs;
  RxInt selectedBlock = 0.obs;
  RxBool select = false.obs;
  RxBool selectBlockBool = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    selectedCity.value = -1;
    selectedDistrict.value = -1;
    selectedBlock.value = -1;
    final loaded = await repository.getLocation();
    cities.value = loaded.map((city) {
      // District에 전체 옵션 추가
      final blocksOfAllDistricts =
          city.districts.expand((district) => district.blocks).toList();
      final allDistrict = District(
        name: '전체',
        blocks: blocksOfAllDistricts,
      );
      
      return City(
        name: city.name,
        districts: city.districts,
      );
    }).toList();
  }

   Future<void> selectCity(int i) async {
    districts.value = [];
    blocks.value = [];
    districts.value = cities[i].districts;
    selectedCity.value = i;
    selectedDistrict.value = -1;
    selectedBlock.value = -1;

  }

  Future<void> selectDistrict(int i) async {
    print("클릭2");
    print("selectDistrict : ${districts[i].blocks}");
    blocks.value = districts[i].blocks;
    selectedDistrict.value = i;
    selectedBlock.value = -1;
  }

  Future<void> selectBlock(int i) async {
    print(i);
    selectedBlock.value = i;
    print(selectedBlock.value);
  }


}
