import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_order/app/my_app_controller.dart';
import 'package:food_order/core/data/repositories/shared_preference_repository.dart';
import 'package:food_order/core/enums/message_type.dart';
import 'package:food_order/ui/shared/colors.dart';
import 'package:get/get.dart';
import '../../core/enums/connectivity_status.dart';
import '../../core/services/cart_service.dart';
import '../../core/services/connectivity_service.dart';
import '../../core/services/location_service.dart';
import 'custom_widgets/custom_toast.dart';

// Getx has isEmail so we don't really need it anymore (general check)
// bool isEmail(String value) {
//   RegExp regExp = new RegExp(
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//   return regExp.hasMatch(value);
// }

bool isPasswordValid(String value) {
  RegExp regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return regExp.hasMatch(value);
}

double screenWidth(double percent) {
  return Get.size.width / percent;
}

double screenHeight(double percent) {
  return Get.size.height / percent;
}

SharedPreferenceRepository get storage => Get.find();

CartService get cartService => Get.find();
LocationService get locationService => Get.find();

ConnectivityService get connectivityService => Get.find();
bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

void checkConnection(Function() function) {
  if (isOnline)
    function();
  else
    CustomToast.showMessage(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
          color: AppColors.mainOrangeColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: SpinKitCircle(
          color: AppColors.mainOrangeColor,
        ),
      );
    });

double get taxAmount => 0.18;

double get deliveryAmount => 0.1;
