// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:banchaproj/utility/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    required this.data,
    required this.pressFunc,
    this.fullWidthButton,
  }) : super(key: key);

  final String data;
  final Function() pressFunc;
  final bool? fullWidthButton;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: pressFunc,
      text: data,
      fullWidthButton: fullWidthButton ?? false,
      shape: GFButtonShape.pills,
      color: AppConstant.primaryColor,
    );
  }
}
