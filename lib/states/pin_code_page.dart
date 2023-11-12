// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banchaproj/states/main_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:get/get.dart';

import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/utility/app_controller.dart';
import 'package:banchaproj/utility/app_service.dart';
import 'package:banchaproj/widgets/widget_text.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({
    Key? key,
    required this.borndate,
    required this.cid,
  }) : super(key: key);

  @override
  State<PinCodePage> createState() => _PinCodePageState();

  final String borndate;
  final String cid;
}

class _PinCodePageState extends State<PinCodePage> {
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    appController.pins.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
          return Obx(() {
            return Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                WidgetText(
                  data: 'ใส่รหัสผ่านของท่าน',
                  textStyle: AppConstant().h2Style(),
                ),
                WidgetText(
                  data:
                      '(ไม่เกิน 6 ตัวอักษร ครั้งที่ ${appController.pins.length + 1})',
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
                      print('## ค่า pin ที่ได้ ----> $pin');

                      if (pin.isEmpty) {
                        Get.snackbar('Pincode ?', 'Please Fill PinCode',
                            backgroundColor: AppConstant.bgColor,
                            colorText: Colors.white);
                      } else {
                        appController.pins.add(pin);

                        if (appController.pins.length == 2) {
                          if (appController.pins[0] == appController.pins[1]) {
                            //Process Save

                            AppService()
                                .processSavePin(
                              pinCode: appController.pins.last,
                              borndate: widget.borndate,
                              cid: widget.cid,
                            )
                                .then((value) {
                              Get.snackbar('Save Pincode Success',
                                  'ThankYou Save Success');

                              Get.offAll(const MainHome());
                            });
                          } else {
                            Get.snackbar('Pincode ไม่เหมือนกัน',
                                'กรุณากรอก Pincode ให้เหมือนกัน',
                                backgroundColor: Colors.deepOrangeAccent,
                                colorText: Colors.white);
                            appController.pins.clear();
                          }
                        }
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
