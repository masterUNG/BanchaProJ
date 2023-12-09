import 'package:banchaproj/states/show_profile.dart';
import 'package:banchaproj/states/test.dart';
import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/utility/app_controller.dart';
import 'package:banchaproj/utility/app_dialog.dart';
import 'package:banchaproj/widgets/widget_button.dart';
import 'package:banchaproj/widgets/widget_image_asset.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppController appController = Get.put(AppController());

  var paths = <String>[
    'images/image0.png',
    'images/image1.png',
    'images/image2.png',
    'images/image3.png',
    'images/image0.png',
    'images/image1.png',
    'images/image2.png',
    'images/image3.png',
  ];
  var titles = <String>[
    'Title1',
    'Title2',
    'Title3',
    'Title4',
    'Title1',
    'Title2',
    'Title3',
    'ออกจากระบบ',
  ];

  var widgets = <Widget>[
    const ShowProfile(),
    const Test(),
    const Test(),
    const Test(),
    const Test(),
    const Test(),
    const Test(),
    const Test(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.primaryColor,
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return Obx(() {
          return appController.userModelLogins.isEmpty
              ? const SizedBox()
              : ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      width: boxConstraints.maxWidth,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppConstant.bgColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          WidgetText(
                            data: 'ยินดีต้อนรับ',
                            textStyle:
                                AppConstant().h2Style(color: Colors.white),
                          ),
                          WidgetText(
                            data: appController.userModelLogins.last.nAME ?? '',
                            textStyle:
                                AppConstant().h3Style(color: Colors.white),
                          ),
                          WidgetText(
                            data:
                                'หมายเลขสมาชิก ${appController.userModelLogins.last.aCCNO}',
                            textStyle:
                                AppConstant().h3Style(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                      itemCount: titles.length,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          if (index == widgets.length - 1) {
                            AppDialog().normalDialog(
                                titleWidget:
                                    const WidgetText(data: 'ออกจากระบบ'),
                                contentWidget: const WidgetText(
                                    data:
                                        'ระบบจะลบทุกอย่างที่คุณบันทึกไว้ โปรด Confirm เพื่อลบ'),
                                firstActionWidget: WidgetButton(
                                  data: 'Comfirm',
                                  pressFunc: () async {
                                    await GetStorage()
                                        .erase()
                                        .then((value) => Get.offAllNamed('/splash'));
                                  },
                                ),
                                actionWidget: WidgetButton(
                                  data: 'Cancel',
                                  pressFunc: () {
                                    Get.back();
                                  },
                                ));
                          } else {
                            Get.to(widgets[index]);
                          }
                        },
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              WidgetImageAsset(
                                path: paths[index],
                                size: 80,
                              ),
                              WidgetText(data: titles[index]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        });
      }),
    );
  }
}
