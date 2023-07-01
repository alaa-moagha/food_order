// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../shared/colors.dart';
// import '../../shared/custom_widgets/custom_button.dart';
// import '../../shared/custom_widgets/custom_text_field.dart';
// import '../login_view/login_view.dart';

// class ResetPasswordView extends StatelessWidget {
//   const ResetPasswordView({super.key});
// NewPasswordContr
//   @override
//   Widget build(BuildContext context) {
    
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Text(
//               'New Password',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: AppColors.mainGreyColor,
//                 fontSize: 30,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             Text(
//               'Please enter your email to receive a \n link to create a new password via email',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: AppColors.mainTextColor,
//                 fontSize: 14,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             customtextfield(
//               Controller: passwordController,
//               hintText: 'New Password',
//             ),
//             customtextfield(
//               Controller: confirmPasswordController,
//               hintText: 'Confirm Password',
//             ),
//             CustomButton(
//                 backgroundColor: AppColors.mainOrangeColor,
//                 textColor: AppColors.mainWhiteColor,
//                 text: 'Next',
//                 onPressed: () {
//                   Get.to(LoginView());
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
