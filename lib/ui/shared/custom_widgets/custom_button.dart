import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? borderColor;
  final Color? backgroundColor;
  final Function onPressed;
  final String? svgName;

  const CustomButton({
    Key? key,
    required this.text,
    this.textColor,
    this.textSize,
    this.textFontWeight,
    this.borderColor,
    this.backgroundColor,
    required this.onPressed,
    this.svgName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (svgName != null) ...[
            SvgPicture.asset('images/$svgName.svg'),
            SizedBox(
              width: screenWidth(20),
            )
          ],
          Text(
            text,
            style: TextStyle(
                color: textColor ?? AppColors.mainWhiteColor,
                fontSize: textSize ?? screenWidth(25),
                fontWeight: textFontWeight ?? FontWeight.normal),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
          side: borderColor != null
              ? BorderSide(
                  width: 1, color: borderColor ?? AppColors.mainOrangeColor)
              : null,
          backgroundColor: backgroundColor ?? AppColors.mainOrangeColor,
          shape: StadiumBorder(),
          fixedSize: Size(screenWidth(1.1), screenHeight(15))),
    );
  }
}
