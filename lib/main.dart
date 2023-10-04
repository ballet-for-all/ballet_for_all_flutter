import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'app_bindng.dart';
import 'firebase/firebase_options.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  // DependencyInjection.init();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) => runApp(const MyApp()));

  KakaoSdk.init(
    nativeAppKey: dotenv.get('kakaoSdkKey'),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: '모두의 발레',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF222222),
            elevation: 0,
          ),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: AppPages.initialPage,
        getPages: AppPages.routes,
        locale: Get.deviceLocale,
        defaultTransition: Transition.fade,
        initialBinding: AppBinding(),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        ),
      );
}
