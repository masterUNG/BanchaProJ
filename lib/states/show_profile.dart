// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banchaproj/utility/app_controller.dart';
import 'package:flutter/material.dart';

import 'package:banchaproj/models/user_model.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:get/get.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
         () {
          return SafeArea(
              child: appController.userModelLogins.isEmpty ? const SizedBox() : ListView(
            children: [
              WidgetText(data: 'Name : ${appController.userModelLogins.last.nAME}'),
              WidgetText(data: 'AccNo : ${appController.userModelLogins.last.aCCNO}'),
              WidgetText(data: 'Unit : ${appController.userModelLogins.last.uNIT}'),
              WidgetText(data: 'Sec : ${appController.userModelLogins.last.sEC}'),
              WidgetText(data: 'Position : ${appController.userModelLogins.last.pOSITION}'),
              WidgetText(data: 'Phone : ${appController.userModelLogins.last.pHONE}'),
              WidgetText(data: 'MemData : ${appController.userModelLogins.last.mEMBDATE}'),
            ],
          ));
        }
      ),
    );
  }
}
