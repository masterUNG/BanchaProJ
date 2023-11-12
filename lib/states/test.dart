import 'package:banchaproj/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: WidgetText(data: 'Test')),);
  }
}