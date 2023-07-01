import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_order/ui/views/login_view/login_view.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:get/get.dart';

import '../../../core/translation/app_translation.dart';
import '../signup_view/signup_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: ClipShadowShadowPainter(
                    clipper: LandingClipper(),
                    shadow: Shadow(blurRadius: 12),
                  ),
                  child: ClipPath(
                    clipper: LandingClipper(),
                    child: Container(
                      width: screenWidth(1),
                      height: screenHeight(2.2),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'images/background_objects.svg',
                        fit: BoxFit.fitWidth,
                        // width: screenWidth(1),
                      ),
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(252, 96, 17, 1)),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenWidth(1.7)),
                    child: SvgPicture.asset(
                      'images/Logo_new.svg',
                      width: screenWidth(2.5),
                      height: screenWidth(2.5),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth(15)),
              child: Text(
                tr("slogan"),
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontSize: screenWidth(25)),
              ),
            ),
            Column(
              children: [
                CustomButton(
                    text: tr("key_login"),
                    // svgName: 'Facebook',
                    onPressed: () {
                      Get.off(LoginView());
                    }),
                SizedBox(
                  height: screenWidth(25),
                ),
                CustomButton(
                    text: tr("create_account"),
                    textColor: AppColors.mainOrangeColor,
                    borderColor: AppColors.mainOrangeColor,
                    backgroundColor: AppColors.mainWhiteColor,
                    onPressed: () {
                      Get.to(SignupView());
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6843750, size.width,
        size.height * 0.9125000);
    path0.cubicTo(
        size.width * 1.0006250,
        size.height * 0.9643750,
        size.width * 0.9393750,
        size.height * 1.0006250,
        size.width * 0.9125000,
        size.height);
    path0.cubicTo(size.width * 0.8693750, size.height, size.width * 0.7906250,
        size.height, size.width * 0.7500000, size.height);
    path0.cubicTo(
        size.width * 0.7068750,
        size.height * 1.0006250,
        size.width * 0.6931250,
        size.height * 0.9543750,
        size.width * 0.6875000,
        size.height * 0.9225000);
    path0.cubicTo(
        size.width * 0.6606250,
        size.height * 0.7375000,
        size.width * 0.6175000,
        size.height * 0.6693750,
        size.width * 0.5000000,
        size.height * 0.6700000);
    path0.cubicTo(
        size.width * 0.3831250,
        size.height * 0.6706250,
        size.width * 0.3250000,
        size.height * 0.7543750,
        size.width * 0.3100000,
        size.height * 0.9175000);
    path0.cubicTo(
        size.width * 0.3056250,
        size.height * 0.9631250,
        size.width * 0.2868750,
        size.height * 0.9993750,
        size.width * 0.2525000,
        size.height);
    path0.cubicTo(size.width * 0.2106250, size.height, size.width * 0.1268750,
        size.height, size.width * 0.0850000, size.height);
    path0.cubicTo(
        size.width * 0.0512500,
        size.height * 1.0012500,
        size.width * 0.0012500,
        size.height * 0.9662500,
        0,
        size.height * 0.9150000);
    path0.quadraticBezierTo(0, size.height * 0.6862500, 0, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
