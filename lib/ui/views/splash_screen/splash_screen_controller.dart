import 'package:food_order/ui/views/landing_view/landing_view.dart';
import 'package:food_order/ui/views/login_view/login_view.dart';
import 'package:food_order/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import '../../../core/data/repositories/shared_preference_repository.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';
import '../intro_view/intro_view.dart';
import 'package:food_order/ui/views/language_view/language_view.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (!storage.langSelected()) {
        Get.off(LanguageView());
      } else {
        Get.off(
          storage.getIsLogined() ? MainView() : LandingView(),
        ); // it has transition parameter
      }

      storage.setFirstLaunch(false);
    });

    super.onInit();
  }
}
