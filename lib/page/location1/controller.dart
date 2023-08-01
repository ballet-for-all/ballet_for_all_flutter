import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../repository/city/block.dart';
import '../../repository/city/city.dart';
import '../../repository/city/district.dart';
import '../../repository1/location_repository.dart';

class LocationController extends GetxController {
  final repository = Get.put(LocationRepository());
  final cities = <City>[].obs;
  final districts = <District>[].obs;
  RxList blocks = <Block>[].obs;
  RxInt selectedCity = 0.obs;
  RxInt selectedDistrict = 0.obs;
  RxInt selectedBlock = 0.obs;
  RxBool settingBtnChk = false.obs;
  RxBool select = false.obs;
  RxBool selectBlockBool = false.obs;
  List<Block> list = <Block>[];
  List<District> listDistrict = [];

  Set<dynamic> list_block = {};

  List<Map<String,dynamic>> listmap = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    selectedCity.value = -1;
    selectedDistrict.value = -1;
    selectedBlock.value = -1;
    final loaded = await repository.getLocation();
    cities.value = loaded.map((city) {
     // print(loaded.asMap().entries.map((e) => print(e.key)));
      //print(loaded.asMap().entries.map((e) => print(e)));
      // District에 전체 옵션 추가
      //print(city.districts.asMap().entries.toList().map((e) => print(e.key)).toList());
      print(city.districts.asMap().entries.toList().map((e) => print(e.value)).toList());
      
      
      city.districts.asMap().entries.toList().map((e){
        print(e.key);
        print(e.value);
        listmap.add({
          'key' : e.key,
          'value' : e.value,
        });
      });

      print(listmap);

      //print(listmap.map((e) => print(e.values)));
      //print(city.districts.expand((element) => element.blocks.asMap().entries.toList()));
      final blocksOfAllDistricts =
          city.districts.expand((district) => district.blocks).toList();
      final allDistrict = District(
        name: '전체',
        blocks: blocksOfAllDistricts,
      );
      //print('sdf ${blocksOfAllDistricts}');


      final districts = [allDistrict, ...city.districts]
          // District에서 이름이 빈 경우 제거
          .map((district) {
        final blocks = [const Block(name: '전체'), ...district.blocks];
        for (int i = 0; i < district.blocks.length; i++) {
          //print(district.blocks[i].name);
          //print("dist ${city}");
          // print(city.name);
          // print(city.districts);
          
          //print(blocks.asMap().entries.map((e) => print(e.key)));
          list_block.add(district.blocks[i].name);
        }
        return District(
          name: district.name,
          blocks: blocks,
        );
      }).toList();

      return City(
        name: city.name,
        districts: city.districts,
      );
    }).toList();

    //print(list_block);
  }

  Future<void> selectCity(int i) async {
    // districts.value = [];
    // blocks.value = [];
    districts.value = cities[i].districts;
    selectedCity.value = i;
    selectedDistrict.value = -1;
    selectedBlock.value = -1;
    settingBtnChk.value = false;
  }

  Future<void> selectDistrict(int i) async {
    blocks.value = districts[i].blocks;
    selectedDistrict.value = i;
    selectedBlock.value = -1;
    settingBtnChk.value = false;
  }

  Future<void> selectBlock(int i, int j) async {
    //blocks.value = [];
    blocks.value = districts[i].blocks;
    selectedBlock.value = j;
    settingBtnChk.value = true;
  }

  void blockAddList(list1) {
    // print(list1);
    list.add(list1);
    //print(list);
    //print(list['name']);
  }

  void selectdis(String i, int k) {
    //print(i);
    //print(districts.first.blocks);
    //final list =  blocks.where((p0) => p0.contains());
    //print(list);
    //blocks.value = [];
    //blocks.value = districts[i].blocks;
    //selectedBlock.value = i;
  }

  void searchText(String text) {
    //print(text);
    //print(list_block);
    districts.value = cities[0].districts;
    // for(int i = 0 ; i<cities.length; i++){
    //   for(int j=0; j<cities[i].districts.length; j++){
    //     for(int k = 0; k<cities[i].districts[j].blocks.length;k++){
    //       //print(cities[i].districts[j].blocks[k].name);
    //       print(text.contains(cities[i].districts[j].blocks[k].name));
    //     }
    //   }
    // }
    selectedCity.value = 1;
    blocks.value = districts[0].blocks;
    selectedDistrict.value = 0;
    selectedBlock.value = 1;

    // final first = list_block.indexWhere((note) => note);

    final String isText1 = list_block
        .map((e) {
          print(e.toString());
          return e.toString();
        })
        .where((element) => element.contains(text))
        .toString();
    print(isText1);

    // final String isText = list_block.where((element) {
    //   return element.contains(text);
    // }).toString();
    //print(text);
    //print(cities[0].districts[0].blocks[0].name);

    // String list333 = a.where((element) {
    //   final list_total = [...element.toList()];
    //   print(list_total);
    //  // print(element.first.first.contains(text));
    //   //print(element.first.first);
    //   //print(text);
    //   //print(element.first.first == text);
    //   return element.first.first == text;
    // }).toList().toString();
    //print(list);
    //print(list.toList());
    //print(list);
  }
}
