import 'package:banchaproj/utility/app_controller.dart';
import 'package:banchaproj/utility/app_service.dart';
import 'package:banchaproj/widgets/widget_image_network.dart';
import 'package:banchaproj/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  AppController controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().processReadImage().then((value) {
      if (controller.children.isNotEmpty) {
        controller.children.clear();
      }

      for (var i = 0; i < 10; i++) {
        controller.children.add(WidgetImageNetwork(
          url: controller.imageModels[i].url,
          tapFunc: () {
            print('You tab index ---> $i');
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          return appController.children.isEmpty
              ? const SizedBox()
              : ImageSlideshow(
                  children: controller.children,
                  height: 250,
                );
        });
  }
}
