import 'package:flutter/material.dart';

import 'term_item.dart';

class AgreeTermsView extends StatelessWidget {
  const AgreeTermsView({
    required this.onSignUpClicked,
    Key? key,
  }) : super(key: key);

  final VoidCallback onSignUpClicked;

  @override
  Widget build(BuildContext context) {
    final safePaddingBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 28),
                      Text(
                        '약관 동의',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222222),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '모두의 발레 서비스 제공을 위해 이용약관에 동의해주세요.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TermItem(
                        text: '서비스 이용약관 전체 동의',
                        textStyle: _termTextStyle.copyWith(
                          color: const Color(0xFF333333),
                          fontWeight: FontWeight.w500,
                        ),
                        onClick: () {},
                        checked: false,
                        option: '필수',
                      ),
                      const Divider(),
                      TermItem(
                        text: '만 14세 이상입니다.',
                        textStyle: _termTextStyle,
                        onClick: () {},
                        checked: false,
                        option: '필수',
                      ),
                      TermItem(
                        text: '위치정보 서비스 이용약관에 동의합니다.',
                        textStyle: _termTextStyle,
                        onClick: () {},
                        checked: false,
                        option: '필수',
                        infoUrl: 'url',
                      ),
                      TermItem(
                        text: '개인정보 수집 ∙ 이용에 동의합니다.',
                        textStyle: _termTextStyle,
                        onClick: () {},
                        checked: false,
                        option: '필수',
                        infoUrl: 'url',
                      ),
                      TermItem(
                        text: '개인정보 제3자 제공에 동의합니다.',
                        textStyle: _termTextStyle,
                        onClick: () {},
                        checked: false,
                        option: '필수',
                        infoUrl: 'url',
                      ),
                      TermItem(
                        text: '이벤트, 할인 혜택 알림 수신에 동의합니다.',
                        textStyle: _termTextStyle,
                        onClick: () {},
                        checked: false,
                        option: '선택',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            height: 56 + safePaddingBottom,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF222222),
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.zero,
                ),
                elevation: 0,
                padding: EdgeInsets.only(bottom: safePaddingBottom),
              ),
              onPressed: onSignUpClicked,
              child: const Text(
                '가입하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get _termTextStyle => const TextStyle(
        color: Color(0xFF666666),
        fontSize: 15,
      );
}
