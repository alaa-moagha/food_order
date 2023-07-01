import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/utils.dart';

class customtextfield extends StatefulWidget {
  const customtextfield({
    super.key,
    // required this.boxColor,
    // required this.fontColor,
    // this.fontSize,
    // required this.fontweight,
    // required this.borderRadius,
    // required this.vPadSize,
    // required this.hPadSize,
    required this.Controller,
    required this.hintText,
    this.validator,
  });

  // final Color boxColor;
  final String hintText;
  // final Color fontColor;
  // final double fontSize;
  // final FontWeight fontweight;
  // final double borderRadius;
  // final double vPadSize;
  // final double hPadSize;
  final TextEditingController Controller;
  final String? Function(String?)? validator;

  @override
  State<customtextfield> createState() => _customtextfieldState();
}

class _customtextfieldState extends State<customtextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(25),
        vertical: screenWidth(30),
      ),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.Controller,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: AppColors.mainOrangeColor),
          fillColor: AppColors.transparentColor,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: screenWidth(27),
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth(5)),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth(15),
            vertical: screenWidth(30),
          ),
        ),
      ),
    );
  }
}
