import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    required this.onKakaoLoginPressed,
    required this.onAppleLoginPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onKakaoLoginPressed;
  final VoidCallback onAppleLoginPressed;

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
                            onPressed: onKakaoLoginPressed,
                            backgroundColor: const Color(0xFFFDE500),
                            iconPath: 'assets/icons/kakao.png',
                            label: '카카오 계정으로 로그인',
                          ),
                          const SizedBox(height: 12),
                          LoginButton(
                            onPressed: onAppleLoginPressed,
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
