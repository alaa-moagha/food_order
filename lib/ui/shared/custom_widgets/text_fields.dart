import 'package:flutter/material.dart';

class textFields extends StatelessWidget {
  const textFields(
      {super.key,
      required this.textLine,
      required this.fonSize,
      required this.textColor,
      required this.fonWeight,
      required this.vPadSize,
      required this.hPadSize,
      required this.tAlign});

  final String textLine;
  final double fonSize, vPadSize, hPadSize;
  final Color textColor;
  final FontWeight fonWeight;
  final TextAlign tAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vPadSize, horizontal: hPadSize),
      child: Text(
        textLine,
        textAlign: tAlign,
        style: TextStyle(
          fontSize: fonSize,
          color: textColor,
          fontWeight: fonWeight,
        ),
      ),
    );
  }
}
