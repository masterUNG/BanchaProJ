import 'package:banchaproj/states/policy_condition.dart';
import 'package:banchaproj/utility/app_constant.dart';
import 'package:banchaproj/widgets/widget_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    countTime();
  }

  Future<void> countTime() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAll(const PolicyCondition());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.bgColor,
      body: Center(
          child: WidgetImageAsset(
        size: 200,
      )),
    );
  }
}
