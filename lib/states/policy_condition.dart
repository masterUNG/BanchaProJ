import 'package:banchaproj/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class PolicyCondition extends StatelessWidget {
  const PolicyCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WidgetText(data: 'เงื่อนไขการใช้ระบบ')),
    );
  }
}
