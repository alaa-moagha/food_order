import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/intro_view/intro_view.dart';
import 'package:get/get.dart';
import '../../../app/my_app.dart';
import '../../../core/data/repositories/shared_preference_repository.dart';
import '../landing_view/landing_view.dart';

class LanguageView extends StatefulWidget {
  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Language',
            style: TextStyle(
              color: AppColors.mainWhiteColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: AppColors.mainOrangeColor,
          elevation: 5,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                // Open settings page
              },
            ),
          ],
        ),
        body: Center(
          child: ListView(
            children: [
              languageTile('English', 'images/us.svg', () {
                storage.setAppLanguage("en");
                Get.updateLocale(getLocal());
                Get.off(IntroView());
              }),
              languageTile('العربية', 'images/sa.svg', () {
                storage.setAppLanguage("ar");
                Get.updateLocale(getLocal());
                Get.off(IntroView());
              }),
              languageTile('Türkçe', 'images/tr.svg', () {
                storage.setAppLanguage("tr");
                Get.updateLocale(getLocal());
                Get.off(IntroView());
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget languageTile(String language, String imagePath, onTap()) {
  return ListTile(
    leading: ClipOval(
      child: SvgPicture.asset(
        imagePath,
        width: screenWidth(10),
        height: screenWidth(10),
        fit: BoxFit.cover,
      ),
    ),
    title: Text(
      language,
      style: TextStyle(
        fontSize: screenWidth(20),
        fontWeight: FontWeight.w700,
        color: AppColors.mainBlackColor,
      ),
    ),
    onTap: () {
      onTap();
    },
    // tileColor: Colors.grey[50],
  );
}
