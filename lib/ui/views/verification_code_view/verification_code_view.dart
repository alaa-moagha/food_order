import 'package:flutter/material.dart';
import 'package:food_order/core/translation/app_translation.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/utils.dart';
import '../login_view/login_view.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              tr("OTP_sent"),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.mainGreyColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              tr("check_mob_num"),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: true,
              animationType: AnimationType.fade,
              hintCharacter: '*',
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.blue.shade50,
              enableActiveFill: true,
              controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
            CustomButton(
                backgroundColor: AppColors.mainOrangeColor,
                textColor: AppColors.mainWhiteColor,
                text: tr("next"),
                onPressed: () {
                  Get.to(LoginView());
                }),
            Row(
              children: [
                Text(
                  tr("receive_failed"),
                  style: TextStyle(
                      fontSize: screenWidth(5),
                      fontWeight: FontWeight.normal,
                      color: AppColors.mainTextColor),
                ),
                Text(
                  tr("click"),
                  style: TextStyle(
                      fontSize: screenWidth(5),
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainOrangeColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
