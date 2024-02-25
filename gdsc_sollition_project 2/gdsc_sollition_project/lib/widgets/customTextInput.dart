import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required String hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
    super.key,
    this.controller, this.focusNode,
  })  : _hintText = hintText,
        _padding = padding;

  final String _hintText;
  final EdgeInsets _padding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: StadiumBorder(),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: const TextStyle(
            color: AppColor.placeholder,
          ),
          contentPadding: _padding,
        ),
      ),
    );
  }
}
