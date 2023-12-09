import 'dart:io';

import 'package:banchaproj/states/pin_code_check.dart';
import 'package:banchaproj/states/spalash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: '/splash',
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: '/pincode',
    page: () => const PinCodeCheck(),
  ),
];

String? keyPage;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverride();

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init().then((value) async {

    var pinCode = await GetStorage().read('pinCode');
    var borndata = await GetStorage().read('borndata');
    var cid = await GetStorage().read('cid');
    print('data ที่ได้จาก main.dart ----> $pinCode, $borndata $cid');

    if (pinCode == null) {
      keyPage = '/splash';
       runApp(const MyApp());
    } else {
      keyPage = '/pincode';
       runApp(const MyApp());
    }

   
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: SplashScreen(),
      getPages: getPages,
      initialRoute: keyPage,
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
