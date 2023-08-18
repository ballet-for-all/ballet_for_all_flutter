import 'package:get/get.dart';
import '../../repository/city/block.dart';
import '../../repository/city/city.dart';
import '../../repository/city/district.dart';
import '../../repository/city/location_repository.dart';
import '../main/main_pages.dart';

class LocationController extends GetxController {
  final repository = Get.put(LocationRepository());
  final cities = <City>[].obs;
  final districts = <District>[].obs;
  final blocks = <Block>[].obs;
  final selectedCity = 0.obs;
  final selectedDistrict = 0.obs;
  final selectedBlock = 0.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    selectedCity.value = -1;
    selectedDistrict.value = -1;
    selectedBlock.value = -1;
    final loaded = await repository.getLocation();
    cities.value = loaded.map((city) {
      final blocksOfAllDistricts =
          city.districts.expand((district) => district.blocks).toList();
      final allDistrict = District(
        name: '전체',
        blocks: blocksOfAllDistricts,
      );
      final districts = [allDistrict, ...city.districts]
          .where((district) => district.name.isNotEmpty)
          .map((district) {
        final blocks = [const Block(name: '전체'), ...district.blocks];
        return District(name: district.name, blocks: blocks);
      }).toList();

      return City(
        name: city.name,
        districts: districts,
      );
    }).toList();
  }

  Future<void> selectCity(int i) async {
    districts.value = cities[i].districts;
    selectedCity.value = i;
    selectedDistrict.value = -1;
    selectedBlock.value = -1;
  }

  Future<void> selectDistrict(int i) async {
    blocks.value = districts[i].blocks;
    selectedDistrict.value = i;
    selectedBlock.value = -1;
  }

  Future<void> selectBlock(int i) async {
    selectedBlock.value = i;
  }

  void searchText(String text) {
    districts.value = cities[0].districts;

    selectedCity.value = 1;
    blocks.value = districts[0].blocks;
    selectedDistrict.value = 0;
    selectedBlock.value = 1;
  }

  void onSettingClick() async {
    Get.toNamed(MainView.routeName,
        arguments: blocks[selectedBlock.value].name);
  }
}
