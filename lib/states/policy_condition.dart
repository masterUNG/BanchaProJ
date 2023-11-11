import 'package:banchaproj/states/authen.dart';
import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/utility/app_controller.dart';
import 'package:banchaproj/widgets/widget_button.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolicyCondition extends StatelessWidget {
  const PolicyCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.bgColor,
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetText(
                  data: 'เงื่อนไขการใช้ระบบ',
                  textStyle: AppConstant().h2Style(color: Colors.white),
                ),
                WidgetText(
                  data: 'กรุณาทำความเข้าใจก่อนใช้บริการ',
                  textStyle: AppConstant().h3Style(color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  width: boxConstraints.maxWidth,
                  height: boxConstraints.maxHeight - 150,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetText(
                          data: 'นโยบายการรักษาข้อมูลส่วนบุคคลของผู้ใช้บริการ',
                          textStyle: AppConstant().h2Style(size: 18),
                        ),
                        WidgetText(
                          data: '1. สิทธิของท่าน',
                          textStyle: AppConstant().h2Style(size: 18),
                        ),
                        WidgetText(
                          data:
                              'สหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด จะรักษาข้อมูลของผู้ใช้บริการที่ได้แจ้งให้สหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด ทราบ โดยจะควบคุมและรักษาข้อมูลให้เป็นความลับปลอดภัยและป้องกันมิให้มีการนำข้อมูลไปใช้ ผิดวัตถุประสงค์และมิให้ผู้ไม่มีสิทธิได้รับข้อมูล เว้นแต่ สหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด จะได้แจ้งให้ผู้ใช้บริการทราบเกี่ยวกับการจะต้องเปิดเผยข้อมูลนั้นแล้ว หรือได้รับความยินยอมจากผู้ใช้บริการ หรือจำเป็นต้องเปิดเผยข้อมูลตามกฎหมายแล้วแต่กรณีในการเก็บรักษาข้อมูลของผู้ใช้บริการ สหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด จะจัดทำระบบป้องกันมิให้ข้อมูลถูกแก้ไข ทำให้เสียหายหรือถูกทำลายโดยไม่ชอบ หรือโดยไม่ได้รับอนุญาต',
                          textStyle: AppConstant().h3Style(),
                        ),
                        WidgetText(
                          data: '2. ข้อมูลที่รวบรวมและเก็บรักษาไว้',
                          textStyle: AppConstant().h2Style(size: 18),
                        ),
                        WidgetText(
                          data:
                              'สหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด จะรวบรวมข้อมูลเกี่ยวกับท่านที่จำเป็น ซึ่งขึ้นอยู่กับประเภทของบริการที่ท่านใช้ผ่านแอพพลิเคชั่นของสหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด เช่น การลงทะเบียนเข้าใช้บริการบางประเภทจะเก็บบันทึกการเข้าออกโดยอัตโนมัติ สหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด จะเก็บรวบรวม รักษา และใช้ข้อมูลเกี่ยวกับท่านในกรณีที่สหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด พิจารณาแล้วเห็นว่าจะเป็นประโยชน์ ต่อการทำงานของสหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด จำกัด หรือเพื่อให้ท่านได้รับบริการที่ดีจากสหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด โดยจะใช้ข้อมูลของท่านให้เป็นไปตามกฎหมายและกฎเกณฑ์ต่าง ๆ ที่เกี่ยวข้อง หรือเพื่อสร้างสรรค์และปรับปรุงบริการของสหกรณ์ออมทรัพย์ สามัญศึกษาร้อยเอ็ด จำกัด จำกัด',
                          textStyle: AppConstant().h3Style(),
                        ),
                        WidgetText(
                          data: 'data',
                          textStyle: AppConstant().h2Style(),
                        ),
                        WidgetText(
                          data: 'data',
                          textStyle: AppConstant().h3Style(),
                        ),
                        WidgetText(
                          data: 'data',
                          textStyle: AppConstant().h2Style(),
                        ),
                        WidgetText(
                          data: 'data',
                          textStyle: AppConstant().h3Style(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      bottomSheet: GetX(
          init: AppController(),
          builder: (AppController appController) {
            return Container(
              decoration: BoxDecoration(color: AppConstant.bgColor),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    checkColor: Colors.white,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: appController.acceptCondition.value,
                    onChanged: (value) {
                      appController.acceptCondition.value = value!;
                    },
                    title: WidgetText(
                      data: 'ฉันได้อ่าน ทำความเข้าใจ และ ยอมรับเงี่ยนไข',
                      textStyle: AppConstant().h3Style(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: WidgetButton(
                      data: 'ต่อไป',
                      pressFunc: () {
                        if (appController.acceptCondition.value) {
                          //Accept

                          Get.offAll(const Authen());
                        } else {
                          Get.snackbar(
                              'ยังไม่ยอมรับเงิือนไข', 'โปรยอมรับเงื่อนไขก่อน');
                        }
                      },
                      fullWidthButton: true,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
