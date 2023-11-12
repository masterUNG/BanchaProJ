import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        for (var element in value.data) {}
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
}
