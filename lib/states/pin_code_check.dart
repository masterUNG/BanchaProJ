// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banchaproj/states/main_home.dart';
import 'package:banchaproj/utility/app_dialog.dart';
import 'package:banchaproj/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:get/get.dart';

import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/utility/app_controller.dart';
import 'package:banchaproj/utility/app_service.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:get_storage/get_storage.dart';

class PinCodeCheck extends StatefulWidget {
  const PinCodeCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<PinCodeCheck> createState() => _PinCodeCheckState();
}

class _PinCodeCheckState extends State<PinCodeCheck> {
  AppController appController = Get.put(AppController());

  String? appPincode;

  @override
  void initState() {
    super.initState();
    appController.pins.clear();
    findAppPincode();
  }

  Future<void> findAppPincode() async {
    appPincode = await GetStorage().read('pinCode');
    print('นี่คือ pinCode ที่ Save ไว้ $appPincode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
          return Obx(() {
            print('ขนาดของ pins ----> ${appController.pins.length}');
            return Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                WidgetText(
                  data:
                      'ใส่รหัสผ่านของท่าน (ครั้งที่ ${appController.pins.length + 1})',
                  textStyle: AppConstant().h2Style(),
                ),
                WidgetText(
                  data: 'สามารถกรอกผิดได้ไม่เกิน 3 ครั้ง',
                  textStyle: AppConstant().h3Style(),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: boxConstraints.maxWidth,
                  height: boxConstraints.maxHeight * 0.75,
                  child: PinCodeWidget(
                    maxPinLength: 6,
                    buttonColor: Colors.white,
                    onEnter: (pin, state) {
                      if (pin == appPincode) {
                        // Pincode OK
                        Get.snackbar('Pincode Success', 'Welcome to MyApp');
                        Get.offAll(const MainHome());
                      } else {
                        if (appController.pins.length == 2) {
                          AppDialog().normalDialog(
                              titleWidget: const WidgetText(
                                  data: 'กรอกรหัสผิดเกิน 3 ครั้ง'),
                              contentWidget: const WidgetText(
                                  data: 'คุณต้องไป Login ใหม่'),
                              actionWidget: WidgetButton(
                                data: 'Login',
                                pressFunc: () async {
                                  await GetStorage().erase().then((value) {
                                    Get.offAllNamed('/splash');
                                  });
                                },
                              ));
                        }
                        appController.pins.add(pin);
                      }
                    },
                    onChangedPin: (pin) {},
                  ),
                ),
              ],
            );
          });
        }),
      ),
    );
  }
}
