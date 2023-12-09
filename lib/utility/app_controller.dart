import 'package:banchaproj/models/image_model.dart';
import 'package:banchaproj/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool acceptCondition = false.obs;

  RxList<String> pins = <String>[].obs;

  RxInt indexBody = 0.obs;

  RxList<UserModel> userModelLogins = <UserModel>[].obs;

  RxList<ImageModel> imageModels = <ImageModel>[].obs;

  RxList<Widget> children = <Widget>[].obs;
}
