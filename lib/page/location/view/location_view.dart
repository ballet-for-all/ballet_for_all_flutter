import 'package:flutter/material.dart';

import '../../../shared/widget/safe_bottom_button.dart';
import 'location_list_item.dart';

class LocationView extends StatefulWidget {
  const LocationView({
    required this.cities,
    required this.districts,
    required this.blocks,
    required this.selectedCity,
    required this.selectedDistrict,
    required this.selectedBlock,
    required this.initializeData,
    required this.onCitySelected,
    required this.onDistrictSelected,
    required this.onBlockSelected,
    Key? key,
  }) : super(key: key);

  final List<String> cities;
  final List<String> districts;
  final List<String> blocks;
  final int selectedCity;
  final int selectedDistrict;
  final int selectedBlock;
  final VoidCallback initializeData;
  final Function(int) onCitySelected;
  final Function(int) onDistrictSelected;
  final Function(int) onBlockSelected;

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.initializeData();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '내 동네 설정하기',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 22),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (text) {
                        // TODO(ghrud92): 동네 검색
                      },
                      style: const TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        hintText: '동이름(읍,면)으로 검색',
                        hintStyle: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF999999),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF5F5F5),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // TODO(ghrud92): 위치 권한 요청 & 현재 위치로 동네 변경
                    },
                    icon: Image.asset(
                      'assets/icons/location.png',
                      width: 45,
                      height: 45,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        final city = widget.cities[i];
                        return LocationListItem(
                          text: city,
                          selected: widget.selectedCity == i,
                          onTap: () => widget.onCitySelected(i),
                        );
                      },
                      itemCount: widget.cities.length,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        final district = widget.districts[i];
                        return LocationListItem(
                          text: district,
                          selected: widget.selectedDistrict == i,
                          onTap: () => widget.onDistrictSelected(i),
                        );
                      },
                      itemCount: widget.districts.length,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        final block = widget.blocks[i];
                        return LocationListItem(
                          text: block,
                          selected: widget.selectedBlock == i,
                          onTap: () => widget.onBlockSelected(i),
                        );
                      },
                      itemCount: widget.blocks.length,
                    ),
                  ),
                ],
              ),
            ),
            SafeBottomButton(
              onTap: widget.selectedBlock != -1
                  ? () {
                      // TODO(ghrud92): 동네 설정 완료
                    }
                  : null,
              child: const Text(
                '설정하기',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
}
