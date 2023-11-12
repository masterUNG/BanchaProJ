import 'package:banchaproj/bodys/contact.dart';
import 'package:banchaproj/bodys/home.dart';
import 'package:banchaproj/bodys/news.dart';
import 'package:banchaproj/bodys/profile.dart';
import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/utility/app_controller.dart';
import 'package:banchaproj/utility/app_service.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'หน้าแรก',
    'ข่าวสาร',
    'ติดต่อ',
    'โปรไฟร์',
  ];

  var iconDatas = <IconData>[
    Icons.home,
    Icons.newspaper,
    Icons.contact_phone,
    Icons.person,
  ];

  var bodys = <Widget>[
    const Home(),
    const News(),
    const Contact(),
    const Profile(),
  ];

  AppController appController = Get.put(AppController());

  var items = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();

    AppService().processFindUserModelLogin();

    for (var i = 0; i < titles.length; i++) {
      items.add(
        BottomNavigationBarItem(icon: Icon(iconDatas[i]), label: titles[i]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() {
        return bodys[appController.indexBody.value];
      })),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: items,
          currentIndex: appController.indexBody.value,
          unselectedItemColor: AppConstant.primaryColor,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            appController.indexBody.value = value;
          },
          backgroundColor: AppConstant.bgColor,
        );
      }),
    );
  }
}
