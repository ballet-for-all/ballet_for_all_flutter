import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../repository/academy/sns.dart';
import '../../../shared/extension/widget_list_extension.dart';

const _maxSnsIconCount = 2;
const _iconColor = Color(0xFFCCCCCC);

class SnsIconButtons extends StatelessWidget {
  const SnsIconButtons({
    required this.phone,
    required this.sns,
    super.key,
  });

  final List<String> phone;
  final Sns sns;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 26,
            height: 26,
            child: PopupMenuButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.call_outlined),
              color: _iconColor,
              onSelected: (phoneNumber) {
                // TODO(ghrud92): 전화 걸기 호출
              },
              itemBuilder: (context) => phone
                  .map(
                    (phoneNumber) => PopupMenuItem(
                      value: phoneNumber,
                      child: Text(phoneNumber),
                    ),
                  )
                  .toList(),
            ),
          ),
          ...sns.sortedSnsEntries.take(_maxSnsIconCount).map((entry) {
            final snsType = entry.key;
            final snsUrl = entry.value;
            return SizedBox(
              width: 26,
              height: 26,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // TODO(ghrud92): SNS 호출
                  debugPrint(snsUrl);
                },
                icon: _snsTypeToIcon(snsType),
              ),
            );
          }).toList(),
          if (sns.sortedSnsEntries.length > _maxSnsIconCount)
            SizedBox(
              width: 26,
              height: 26,
              child: IconButton(
                onPressed: () {
                  // 더보기 버튼 UI 반영
                },
                icon: SvgPicture.asset('assets/icons/more-horiz-circle.svg'),
              ),
            ),
        ].withSeperator(const SizedBox(width: 16)),
      );

  Widget _snsTypeToIcon(SnsType type) {
    switch (type) {
      case SnsType.kakaoTalk:
        return SvgPicture.asset('assets/icons/kakao-plus.svg', width: 26);
      case SnsType.instagram:
        return SvgPicture.asset('assets/icons/instagram.svg', width: 26);
      // TODO(ghrud92) 나머지 SNS 추가
      default:
        return SvgPicture.asset('assets/icons/more-horiz-circle.svg', width: 26);
    }
  }
}
