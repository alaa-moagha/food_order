import 'package:food_order/core/services/base_controller.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:food_order/ui/views/main_view/main_view.dart';

class CheckoutController extends BaseController {
  @override
  void onClose() {
    cartService.clearCart();
    Get.to(MainView());
    super.onClose();
  }
}
