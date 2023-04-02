import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp2View extends StatelessWidget {
  const SignUp2View({
    required this.onKakaoLoginPressed,
    required this.onAppleLoginPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onKakaoLoginPressed;
  final VoidCallback onAppleLoginPressed;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
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
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 107, left: 48),
                    child: Text(
                      '매일\n우아해질\n당신을 위해',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 130,
                    height: 130,
                    // TODO(kimhokyung): 이름 텍스트를 포함한 SVG 파일로 변경
                    child: SvgPicture.asset('assets/images/wings.svg'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 80),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: onKakaoLoginPressed,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.yellow,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/kakao.png',
                                  width: 27,
                                  height: 27,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '카카오 계정으로 로그인',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: onAppleLoginPressed,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/apple.png',
                                  width: 27,
                                  height: 27,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Apple ID로 로그인',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     const SizedBox(height: 107),
                //     Container(
                //       width: double.infinity,
                //       padding: const EdgeInsets.symmetric(horizontal: 24),
                //       child: const Text(
                //         '매일\n우아해질\n당신을 위해',
                //         style: TextStyle(
                //           fontSize: 36,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(height: 44),
                //     SizedBox(
                //       width: 130,
                //       height: 130,
                //       // TODO(kimhokyung): 이름 텍스트를 포함한 SVG 파일로 변경
                //       child: SvgPicture.asset('assets/images/wings.svg'),
                //     ),
                //     const SizedBox(height: 116),
                //     SizedBox(
                //       width: double.infinity,
                //       height: 60,
                //       child: ElevatedButton(
                //         onPressed: onKakaoLoginPressed,
                //         style: ElevatedButton.styleFrom(
                //           foregroundColor: Colors.black,
                //           backgroundColor: Colors.yellow,
                //           shape: const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.zero,
                //           ),
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               'assets/icons/kakao.png',
                //               width: 27,
                //               height: 27,
                //             ),
                //             const SizedBox(width: 8),
                //             const Text('카카오 계정으로 로그인'),
                //           ],
                //         ),
                //       ),
                //     ),
                //     const SizedBox(height: 12),
                //     SizedBox(
                //       width: double.infinity,
                //       height: 60,
                //       child: ElevatedButton(
                //         onPressed: onAppleLoginPressed,
                //         style: ElevatedButton.styleFrom(
                //           foregroundColor: Colors.black,
                //           backgroundColor: Colors.white,
                //           shape: const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.zero,
                //           ),
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               'assets/icons/apple.png',
                //               width: 27,
                //               height: 27,
                //             ),
                //             const SizedBox(width: 8),
                //             const Text('Apple ID로 로그인'),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      );
}
