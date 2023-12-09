import 'package:banchaproj/models/image_model.dart';
import 'package:banchaproj/models/user_model.dart';
import 'package:banchaproj/states/pin_code_page.dart';
import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/utility/app_controller.dart';
import 'package:banchaproj/utility/app_dialog.dart';
import 'package:banchaproj/widgets/widget_button.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> checkLogin({
    required String borndate,
    required String cid,
  }) async {
    String urlApi =
        'https://bbnet-host.com/api/coop/semaudon_member_idcoop.php?borndate=$borndate&cid=$cid';

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

  Future<void> processFindUserModelLogin() async {
    String bonddate = GetStorage().read('borndata');
    String cid = GetStorage().read('cid');

    String urlApi =
        'https://bbnet-host.com/api/coop/semaudon_member_idcoop.php?borndate=$bonddate&cid=$cid';

    await Dio().get(urlApi).then((value) {
      for (var element in value.data) {
        UserModel userModel = UserModel.fromJson(element);
        appController.userModelLogins.add(userModel);
      }
    });
  }

  Future<void> processReadImage() async {
    await Dio().get(AppConstant.urlAPIimage).then((value) {
      for (var element in value.data) {
        ImageModel imageModel = ImageModel.fromMap(element);
        appController.imageModels.add(imageModel);
      }
    });
  }
}
