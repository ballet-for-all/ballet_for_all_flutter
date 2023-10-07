import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  final searchInputTap = false.obs;
  final searchListText = [].obs;

  List<String> cityname = [];

  List<Block> blocksOfAllDistricts = [];

  List<String> allLocation = [];

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

    for (int i = 0; i < cities.length; i++) {
      for (int j = 1; j < cities[i].districts.length; j++) {
        for (int k = 0; k < cities[i].districts[j].blocks.length; k++) {
          allLocation.add(
              '${cities[i].name} ${cities[i].districts[j].name} ${cities[i].districts[j].blocks[k].name}');
        }
      }
    }
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

  void searchText(String text) async {
    List<String> searchResult = [];

    for (var item in allLocation) {
      if (item.contains(text)) {
        searchResult.add(item);
      }
    }
    if (searchResult.isEmpty) {
      searchListText.value = [text];
    } else {
      searchListText.value = searchResult;
    }
  }

  void onSettingClick() async {
    Get.toNamed(MainPage.routeName,
        arguments: {'location': blocks[selectedBlock.value].name});
  }

  Future<void> geoLocation() async {
    String city = '';
    String district = '';
    String dong = '';

    isLoading.value = true;
    await Geolocator.requestPermission();
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String gpsUrl =
        'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=${position.longitude}&y=${position.latitude}';

    final responseGps = await http.get(Uri.parse(gpsUrl), headers: {
      'authorization': 'KakaoAK ${dotenv.get('kakaoSdkKey')}',
    });
    final Map result = json.decode(responseGps.body);

    // ignore: avoid_dynamic_calls
    final address = result['documents'][0];

    // ignore: avoid_dynamic_calls
    city = address['region_1depth_name'].toString();
    // ignore: avoid_dynamic_calls
    if (address['region_2depth_name'].toString().length > 3) {
      // ignore: avoid_dynamic_calls
      district =
          address['region_2depth_name'].toString().split(' ')[0].toString();
      // ignore: avoid_dynamic_calls, prefer_interpolation_to_compose_strings
      dong = address['region_2depth_name'].toString().split(' ')[1].toString() +
          " " +
          // ignore: avoid_dynamic_calls
          address['region_3depth_name'].toString();
    } else {
      // ignore: avoid_dynamic_calls
      district = address['region_2depth_name'].toString();
      // ignore: avoid_dynamic_calls
      dong = address['region_3depth_name'].toString();
    }

    for (int i = 0; i < 17; i++) {
      for (int j = 1; j < cities[i].districts.length; j++) {
        for (int k = 0; k < cities[i].districts[j].blocks.length; k++) {
          if (cities[i].name == city &&
              cities[i].districts[j].name == district &&
              cities[i].districts[j].blocks[k].name == dong) {
            selectedCity.value = i;
            districts.value = cities[i].districts;
            blocks.value = districts[j].blocks;
            selectedDistrict.value = j;
            selectedBlock.value = k;
            found = true;
            isLoading.value = false;
            Get.offAllNamed(MainPage.routeName, arguments: {'location': dong});
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
  }

  void searchTextSelect(index) {
    final str = searchListText[index].toString().split(' ');
    if (str[2] == '전체') {
      Get.offAllNamed(MainPage.routeName,
          arguments: {'location': '${str[1]} ${str[2]}'});
    } else {
      Get.offAllNamed(MainPage.routeName, arguments: {'location': str[2]});
    }
  }

  void searchTextOnChange(String text) {
    if (text.isEmpty) {
      searchInputTap.value = false;
    } else {
      searchText(text);
      searchInputTap.value = true;
    }
  }
}
