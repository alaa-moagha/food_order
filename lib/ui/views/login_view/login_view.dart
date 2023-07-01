import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_order/core/data/repositories/shared_preference_repository.dart';
import 'package:food_order/core/translation/app_translation.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/login_view/login_controller.dart';
import 'package:get/get.dart';
import '../../../app/my_app.dart';
import '../../../core/enums/request_status.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(24),
                ),
                child: Text(
                  tr('key_login'),
                  style: TextStyle(
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth(12)),
                ),
              ),
              customtextfield(
                Controller: controller.emailController,
                hintText: tr("email_hint"),
                validator: (value) {
                  return (value!.isEmpty || !GetUtils.isEmail(value))
                      ? tr("check_email")
                      : null;
                },
              ),
              customtextfield(
                Controller: controller.passwordController,
                hintText: tr("pass_hint"),
                validator: (value) {
                  return (value!.isEmpty || !isPasswordValid(value))
                      ? tr("check_pass")
                      : null;
                },
              ),
              CustomButton(
                  text: tr("key_login"),
                  onPressed: () {
                    // customLoader();
                    controller.login();
                  }),
              Padding(
                padding: EdgeInsets.only(
                    top: screenWidth(25), bottom: screenWidth(35)),
                child: Text(
                  tr("forgot_pass"),
                  style: TextStyle(
                      fontSize: screenWidth(25),
                      fontWeight: FontWeight.normal,
                      color: AppColors.mainTextColor),
                ),
              ),
              Text(
                tr("login_with"),
                style: TextStyle(
                    fontSize: screenWidth(25),
                    fontWeight: FontWeight.normal,
                    color: AppColors.mainTextColor),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenWidth(25), bottom: screenWidth(35)),
                child: CustomButton(
                  text: tr("login_fb"),
                  backgroundColor: AppColors.mainBlueColor,
                  svgName: 'Facebook',
                  onPressed: () {},
                ),
              ),
              CustomButton(
                text: tr("login_ggl"),
                backgroundColor: AppColors.mainRedColor,
                svgName: 'google-plus-logo',
                onPressed: () {},
              ),
              SizedBox(height: screenWidth(35)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr("no_account"),
                    style: TextStyle(
                        fontSize: screenWidth(25),
                        fontWeight: FontWeight.normal,
                        color: AppColors.mainTextColor),
                  ),
                  Text(
                    tr("sign_up"),
                    style: TextStyle(
                        fontSize: screenWidth(25),
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainOrangeColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// IconButton(
//                   onPressed: () {
//                     Get.defaultDialog(
//                         title: "Change Language",
//                         content: Column(
//                           children: [
//                             TextButton(
//                                 onPressed: () {
//                                   SharedPreferenceRepository.setAppLanguage(
//                                       "en");
//                                   Get.updateLocale(getLocal());
//                                   Get.back();
//                                 },
//                                 child: Text('English')),
//                             TextButton(
//                                 onPressed: () {
//                                   SharedPreferenceRepository.setAppLanguage(
//                                       "ar");
//                                   Get.updateLocale(getLocal());
//                                   Get.back();
//                                 },
//                                 child: Text('العربية')),
//                             TextButton(
//                                 onPressed: () {
//                                   SharedPreferenceRepository.setAppLanguage(
//                                       "tr");
//                                   Get.updateLocale(getLocal());
//                                   Get.back();
//                                 },
//                                 child: Text('Türkçe')),
//                           ],
//                         ));
//                   },
//                   icon: Icon(Icons.language)),