import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

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
                        // TODO(kimhokyung): 동네 검색
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
                      // TODO(kimhokyung): 위치 권한 요청 & 현재 위치로 동네 변경
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
            // TODO(kimhokyung): 동네 리스트 UI
          ],
        ),
      );
}
