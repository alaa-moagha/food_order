import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/translation/app_translation.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_text_field.dart';
import '../login_view/login_view.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              tr("reset_pass"),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.mainGreyColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              tr("enter_email"),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            customtextfield(
              Controller: emailController,
              hintText: tr("email_hint"),
            ),
            CustomButton(
                backgroundColor: AppColors.mainOrangeColor,
                textColor: AppColors.mainWhiteColor,
                text: tr("send"),
                onPressed: () {
                  Get.to(LoginView());
                }),
          ],
        ),
      ),
    );
  }
}
