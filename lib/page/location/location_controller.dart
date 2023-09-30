import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../repository/city/block.dart';
import '../../repository/city/city.dart';
import '../../repository/city/district.dart';
import '../../repository/city/location_repository.dart';
import '../main/main_pages.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController {
  final repository = Get.put(LocationRepository());
  final cities = <City>[].obs;
  final districts = <District>[].obs;
  final blocks = <Block>[].obs;
  final selectedCity = 0.obs;
  final selectedDistrict = 0.obs;
  final selectedBlock = 0.obs;
  String city = '';
  String district = '';
  String dong = '';

  List<String> cityname = [];

  List<Block> blocksOfAllDistricts = [];

  bool found = false;
  final isLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    selectedCity.value = -1;
    selectedDistrict.value = -1;
    selectedBlock.value = -1;
    final loaded = await repository.getLocation();

    cities.value = loaded.map((city) {
      blocksOfAllDistricts =
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

  void searchText(String text) async {}

  void onSettingClick() async {
    Get.toNamed(MainPage.routeName,
        arguments: blocks[selectedBlock.value].name);
  }

  Future<void> geoLocation() async {
    isLoading.value = true;
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String gpsUrl =
        'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=${position.longitude}&y=${position.latitude}';

    final responseGps = await http.get(Uri.parse(gpsUrl), headers: {
      "authorization": "KakaoAK bcae6ea307f8c461276037fb3cf73651",
    });
    Map result = json.decode(responseGps.body);

    final list = result['documents'][0]['address_name'].toString().split(' ');
    city = result['documents'][0]['region_1depth_name'].toString();
    if (result['documents'][0]['region_2depth_name'].toString().length > 3) {
      district = result['documents'][0]['region_2depth_name']
          .toString()
          .substring(0, 2);
      dong = result['documents'][0]['region_2depth_name']
              .toString()
              .substring(4, 7) +
          " " +
          result['documents'][0]['region_3depth_name'].toString();
    } else {
      district = result['documents'][0]['region_2depth_name'].toString();
      dong = result['documents'][0]['region_3depth_name'].toString();
    }

    Future.delayed(const Duration(seconds: 0), () {
      for (int i = 0; i < 17; i++) {
        for (int j = 1; j < cities[i].districts.length; j++) {
          for (int k = 0; k < cities[i].districts[j].blocks.length; k++) {
            if (cities[i].districts[j].blocks[k].name == dong) {
              selectedCity.value = i;
              districts.value = cities[i].districts;
              blocks.value = districts[j].blocks;
              selectedDistrict.value = j;
              selectedBlock.value = k;
              found = true;
              isLoading.value = false;
              break;
            }
            if (found) {
              isLoading.value = false;
              break;
            }
          }
          if (found) {
            isLoading.value = false;
            break;
          }
        }
      }
    });
  }
}
