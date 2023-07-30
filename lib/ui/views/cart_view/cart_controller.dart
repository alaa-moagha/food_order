import 'package:food_order/ui/views/checkout_view/checkout_view.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../../core/data/models/cart_model.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';

class CartController extends BaseController {
  // RxList<CartModel> cartList = <CartModel>[].obs;
  List<CartModel> cartList = <CartModel>[]; //! edited
  @override
  void onInit() {
    cartList = cartService.cartList; //! fixed bug
    cartService.calcTotals();
    super.onInit();
  }

  void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

  void changeCount(bool incress, CartModel model) {
    cartService.changeCount(
      incress: incress,
      model: model,
    );
  }

  void clearCart() {
    cartService.clearCart();
  }

  void checkout() {
    runFullLoadingFutureFunction(
        function: Future.delayed(Duration(seconds: 2))
            .then((value) => Get.off(CheckoutView())));
  }
}





// browser stack website























// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import '../../../core/data/models/cart_model.dart';
// import '../../../core/services/base_controller.dart';
// import '../../shared/utils.dart';

// class CartController extends BaseController {
//   RxList<CartModel> cartList = <CartModel>[].obs;
//   void onInit() {
//     cartList.value = storage.getCartList();
//     calcTotals();
//     super.onInit();
//   }

//   void removeFromCart(CartModel model) {
//     cartList.remove(model);
//     storage.setCartList(cartList);
//   }

//   void changeCount(bool incress, CartModel model) {
//     CartModel result = cartList.firstWhere(
//       (element) => element.mealModel!.id == model.mealModel!.id,
//       orElse: () => CartModel(),
//     );

//     int index = cartList.indexOf(result);

//     if (incress) {
//       result.count = result.count! + 1;
//       result.total = result.total! + model.mealModel!.price!;
//     } else {
//       if (result.count! > 1) {
//         result.count = result.count! - 1;
//         result.total = result.total! - model.mealModel!.price!;
//       }
//     }

//     cartList.remove(result);
//     cartList.insert(index, result);

//     storage.setCartList(cartList);
//   }

//   Map<String, double> calcTotals() {
//     double subTotal = 0.0;
//     double tax = 0.0;
//     double deliveryFees = 0.0;
//     double total = 0.0;

//     subTotal =
//         cartList.fold(0.0, (sum, element) => sum + (element.total ?? 0.0));
//     tax = subTotal * taxAmount;
//     deliveryFees = (subTotal + tax) * deliveryAmount;
//     total = subTotal + tax + deliveryFees;
//     return {
//       "sub-total": subTotal,
//       "tax": tax,
//       "delivery": deliveryFees,
//       "total": total,
//     };
//   }
// }
