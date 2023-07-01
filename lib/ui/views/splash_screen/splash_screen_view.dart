import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'images/background.svg',
                fit: BoxFit.cover,
              ),
              SvgPicture.asset(
                'images/Logo_new.svg',
                width: screenWidth(2.5),
                height: screenWidth(2.5),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight(2)),
                child: SpinKitThreeBounce(
                  color: AppColors.mainOrangeColor,
                  size: screenWidth(10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
