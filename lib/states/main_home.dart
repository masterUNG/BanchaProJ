import 'package:banchaproj/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: WidgetText(data: 'This is MainHome')),);
  }
}