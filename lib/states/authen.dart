import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/utility/app_service.dart';
import 'package:banchaproj/widgets/widget_button.dart';
import 'package:banchaproj/widgets/widget_form.dart';
import 'package:banchaproj/widgets/widget_image_asset.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();

  MaskTextInputFormatter idCardMaskText =
      MaskTextInputFormatter(mask: '#-####-#####-##-#');

  MaskTextInputFormatter bondMaskText =
      MaskTextInputFormatter(mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.bgColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    padding: const EdgeInsets.only(bottom: 32),
                    decoration: AppConstant().curveBorder(),
                    width: 250,
                    child: Column(
                      children: [
                        const WidgetImageAsset(
                          size: 150,
                        ),
                        WidgetText(
                          data: 'Title1',
                          textStyle: AppConstant().h2Style(color: Colors.white),
                        ),
                        WidgetText(
                          data: 'Title2',
                          textStyle: AppConstant().h3Style(color: Colors.white),
                        ),
                        WidgetText(
                          data: 'Title3',
                          textStyle: AppConstant().h3Style(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        WidgetText(
                          data: 'กรุณาเข้าสู่ระบบ',
                          textStyle: AppConstant().h3Style(color: Colors.white),
                        ),
                        Form(
                          key: formKey,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                WidgetForm(
                                  validateFunc: (p0) {
                                    if (p0?.isEmpty ?? true) {
                                      return 'กรอกบัตรประจำตัวประชาชน';
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputType: TextInputType.number,
                                  textInputFormatters: [idCardMaskText],
                                  hintText: 'เลขที่บัตรประจำตัวประชาชน',
                                ),
                                WidgetForm(
                                  validateFunc: (p0) {
                                    if (p0?.isEmpty ?? true) {
                                      return 'กรอก วัน/เดือน/ปี';
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputType: TextInputType.number,
                                  textInputFormatters: [bondMaskText],
                                  hintText: 'วัน/เดือน/ปี',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    width: 200,
                    child: WidgetButton(
                      data: 'ตรวจสอบ',
                      pressFunc: () {
                        if (formKey.currentState!.validate()) {
                          String idCard = idCardMaskText.getUnmaskedText();
                          String bond = bondMaskText.getMaskedText();

                          if (idCard.length != 13) {
                            Get.snackbar(
                              'บัตรประจำตัวผิด',
                              'บัตรประจำตัวต้องมี 13 หลัก',
                              backgroundColor: Colors.deepOrange,
                              colorText: Colors.white,
                            );
                          } else if (bond.length != 10) {
                            Get.snackbar(
                              'วันเดือนปี ผิด',
                              'กรอกวันเดือนปีไม่ครบ',
                              backgroundColor: Colors.deepOrange,
                              colorText: Colors.white,
                            );
                          } else {}

                          print('###### idCard ---> $idCard');
                          print('###### bond ---> $bond');

                          AppService().checkLogin(borndate: bond, cid: idCard);
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
