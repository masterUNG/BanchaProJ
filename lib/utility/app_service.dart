import 'package:banchaproj/models/user_model.dart';
import 'package:banchaproj/states/pin_code_page.dart';
import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/utility/app_dialog.dart';
import 'package:banchaproj/widgets/widget_button.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppService {
  Future<void> checkLogin({
    required String borndate,
    required String cid,
  }) async {
    String urlApi =
        'http://bbnet-host.com/api/coop/semaudon_member_idcoop.php?borndate=$borndate&cid=$cid';

    print('##### urlApi ----> $urlApi');

    await Dio().get(urlApi).then((value) {
      try {
        for (var element in value.data) {
          UserModel userModel = UserModel.fromJson(element);
          // Get.snackbar('Login Success',
          //     'ยินดีต้อนรับ ${userModel.nAME} ตำแหน่ง ${userModel.uNIT} สู่แอพ ของเรา',
          //     backgroundColor: AppConstant.primaryColor);

          AppDialog().normalDialog(
              titleWidget: const WidgetText(data: 'Login Success'),
              contentWidget: WidgetText(
                  data:
                      'ยินดีต้อนรับ\n${userModel.nAME}\nตำแหน่ง ${userModel.uNIT}\nสู่แอพ ของเรา\n\nคุณต้องบันทึก Pincode เพื่อความสะดวกในการใช้บริการ'),
              actionWidget: WidgetButton(
                data: 'บันทึก PinCode',
                pressFunc: () {
                  Get.back();
                  Get.offAll(PinCodePage(
                    borndate: borndate,
                    cid: cid,
                  ));
                },
              ));
        }
      } catch (e) {
        Get.snackbar(
          'Login False',
          'Please Try Again',
          backgroundColor: Colors.deepOrange,
          colorText: Colors.white,
        );
      }
    });
  }

  Future<void> processSavePin({
    required String pinCode,
    required String borndate,
    required String cid,
  }) async {
    print('## นี่คือ pin ที่ส่งมาให้ Save ---> $pinCode');

    await GetStorage().write('pinCode', pinCode);
    await GetStorage().write('borndata', borndate);
    await GetStorage().write('cid', cid);
  }
}
