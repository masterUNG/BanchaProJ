// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.textInputFormatters,
    this.hintText,
    this.textInputType,
    this.validateFunc,
  }) : super(key: key);

  final List<TextInputFormatter>? textInputFormatters;
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validateFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(validator: validateFunc,
        keyboardType: textInputType,
        inputFormatters: textInputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          // contentPadding:
          //     const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          filled: true,
          fillColor: Colors.white,
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          border: InputBorder.none
        ),
      ),
    );
  }
}
