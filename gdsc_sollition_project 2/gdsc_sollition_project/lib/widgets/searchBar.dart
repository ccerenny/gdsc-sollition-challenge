import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/const/colors.dart';
import 'package:gdsc_sollition_project/utils/helper.dart';

class SearchBarMenu extends StatelessWidget {
  final String? title;
  const SearchBarMenu({super.key,  this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColor.placeholderBg,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Image.asset(
              Helper.getAssetName("search_filled.png", "virtual"),
            ),
            hintText: title,
            hintStyle: const TextStyle(
              color: AppColor.placeholder,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
