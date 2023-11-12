import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool acceptCondition = false.obs;

  RxList<String> pins = <String>[].obs;

  RxInt indexBody = 0.obs;
}
