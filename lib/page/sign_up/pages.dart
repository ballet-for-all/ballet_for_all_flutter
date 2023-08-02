import 'package:ballet_for_all_flutter/page/sign_up/widget/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SignUpView extends GetView<SignUpPageController> {

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background-image.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.srcOver,
                ),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 107, bottom: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: const Text(
                          '매일\n우아해질\n당신을 위해',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          LoginButton(
                            onPressed: controller.onKakaoLoginPressed,
                            backgroundColor: const Color(0xFFFDE500),
                            iconPath: 'assets/icons/kakao.png',
                            label: '카카오 계정으로 로그인',
                          ),
                          const SizedBox(height: 12),
                          LoginButton(
                            onPressed: controller.onAppleLoginPressed,
                            backgroundColor: Colors.white,
                            iconPath: 'assets/icons/apple.png',
                            label: 'Apple ID로 로그인',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    child: SvgPicture.asset('assets/images/ballet-for-all.svg'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
