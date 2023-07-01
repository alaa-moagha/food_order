import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:get/get.dart';
import '../../views/login_view/login_view.dart';
import '../colors.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenWidth(5), horizontal: screenWidth(5)),
      width: screenWidth(5),
      color: AppColors.mainWhiteColor,
      child: Column(
        children: [
          drawerItem(
              size: Get.size,
              text: 'Profile',
              iconName: Icons.verified_user,
              onTap: () {
                Get.back();
                Get.to(LoginView());
              }),
          drawerItem(
              size: Get.size,
              text: 'Address',
              iconName: Icons.pin,
              onTap: () {})
        ],
      ),
    );
  }

  Widget drawerItem(
      {required Size size,
      required IconData iconName,
      required String text,
      required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Icon(iconName),
          SizedBox(
            width: size.width * 0.02,
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
