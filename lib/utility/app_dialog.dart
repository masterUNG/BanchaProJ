import 'package:banchaproj/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  void normalDialog({
    required Widget titleWidget,
    Widget? contentWidget,
    Widget? actionWidget,
    Widget? firstActionWidget,
  }) {
    Get.dialog(
      AlertDialog(
        title: titleWidget,
        content: contentWidget,
        actions: [
          firstActionWidget ?? const SizedBox(),
          actionWidget ??
              WidgetButton(
                data: 'OK',
                pressFunc: () {
                  Get.back();
                },
              )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
