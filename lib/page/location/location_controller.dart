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

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    selectedCity.value = -1;
    selectedDistrict.value = -1;
    selectedBlock.value = -1;
    final loaded = await repository.getLocation();

    List<String> list1 = loaded.map((e) => e.name).toList();
    // print(list1);

    cities.value = loaded.map((city) {
      // print(city.districts.length);

      // cityname.addAll(city.name);

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

  void searchText(String text) async {
    // print(cities[cities.length]);

    final loaded = await repository.getLocation();

    Future.delayed(const Duration(seconds: 3), () {
      for (int i = 0; i < 17; i++) {
        // print(list1.length);
        for (int j = 0; j < cities[i].districts.length; j++) {
          // print(city.districts.length + 1);
          for (int k = 0; k < cities[i].districts[j].blocks.length; k++) {
            print(text);
            if (cities[i].districts[j].blocks[k].name == '$text') {
              print(cities[i].name);
              print(j + 1);
              print(k);
              selectedCity.value = i;
              districts.value = cities[i].districts;
              blocks.value = districts[0].blocks;
              selectedDistrict.value = j + 1;
              selectedBlock.value = k;
              print('있다');
              found = true;
              break;
            }
            if (found) {
              break;
            }
          }
          if (found) {
            break;
          }
        }
      }
    });

    //print(districts.map((element) => element.name));

    districts.value = cities[0].districts;

    // selectedCity.value = 1;
    // blocks.value = districts[0].blocks;
    // selectedDistrict.value = 0;
    // selectedBlock.value = 1;
  }

  void onSettingClick() async {
    Get.toNamed(MainPage.routeName,
        arguments: blocks[selectedBlock.value].name);
  }

  Future<void> geoLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String gpsUrl =
        'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=${position.longitude}&y=${position.latitude}';

    final responseGps = await http.get(Uri.parse(gpsUrl), headers: {
      "authorization": "KakaoAK bcae6ea307f8c461276037fb3cf73651",
    });

    Map result = json.decode(responseGps.body);

    print(result.runtimeType);
    print(result['documents'][0]['address_name']);

    final list = result['documents'][0]['address_name'].toString().split(' ');

    city = list[0];
    district = list[1];
    dong = list[2];

    print('city : $city , district : $district, dong $dong');

    final loaded = await repository.getLocation();

    Future.delayed(const Duration(seconds: 3), () {
      for (int i = 0; i < 17; i++) {
        // print(list1.length);
        for (int j = 0; j < cities[i].districts.length; j++) {
          // print(city.districts.length + 1);
          for (int k = 0; k < cities[i].districts[j].blocks.length; k++) {
            if (cities[i].districts[j].blocks[k].name == dong) {
              print(cities[i].name);
              print(j);
              print(k);
              selectedCity.value = i;
              districts.value = cities[i].districts;
              blocks.value = districts[0].blocks;
              selectedDistrict.value = j;
              selectedBlock.value = k;
              print('있다');
              found = true;
              break;
            }
            if (found) {
              break;
            }
          }
          if (found) {
            break;
          }
        }
      }
    });
  }
}
