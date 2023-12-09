// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetImageNetwork extends StatelessWidget {
  const WidgetImageNetwork({
    Key? key,
    required this.url,
    this.tapFunc,
  }) : super(key: key);

  final String url;
  final Function()? tapFunc;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: tapFunc,
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
