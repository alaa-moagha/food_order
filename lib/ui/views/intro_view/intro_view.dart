import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_order/ui/views/landing_view/landing_view.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:get/get.dart';

import '../../../core/translation/app_translation.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<String> titleList = [
    tr("intro_title1"),
    tr("intro_title2"),
    tr("intro_title3"),
  ];
  List<String> descriptionList = [
    tr("intro_desc1"),
    tr("intro_desc2"),
    tr("intro_desc3"),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(15),
            vertical: screenHeight(15),
          ),
          child: Column(
            children: [
              Container(
                width: screenWidth(1.5),
                height: screenWidth(1.5),
                child: SvgPicture.asset(
                  'images/intro$currentIndex.svg',
                ),
              ),
              DotsIndicator(
                dotsCount: 3,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  color: AppColors.mainBlackColor, // Inactive color
                  activeColor: AppColors.mainOrangeColor,
                ),
              ),
              SizedBox(height: screenWidth(11)),
              Text(
                titleList[currentIndex],
                style: TextStyle(
                    fontSize: screenWidth(15), fontWeight: FontWeight.w700),
              ),
              SizedBox(height: screenWidth(15)),
              Text(
                descriptionList[currentIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth(25),
                ),
              ),
              SizedBox(height: screenWidth(5)),
              CustomButton(
                  text: currentIndex != 2 ? tr("next") : tr("finish"),
                  onPressed: () {
                    setState(
                      () {
                        currentIndex != 2
                            ? currentIndex++
                            : Get.off(LandingView());
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
