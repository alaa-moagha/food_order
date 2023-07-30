import 'package:get/state_manager.dart';
import '../../ui/shared/utils.dart';
import '../data/models/apis/meal_models.dart';
import '../data/models/cart_model.dart';

class CartService {
  RxList<CartModel> cartList = storage.getCartList().obs;
  RxInt cartCount = 0.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble delivery = 0.0.obs;
  RxDouble total = 0.0.obs;

  CartService() {
    cartCount.value = getCartCount();
    calcTotals();
  }

  void addToCart({
    required MealModel model,
    required int count,
    Function? afterAdd,
  }) {
    if (getCartModel(model) != null) {
      int index = cartList.indexOf(getCartModel(model)!);
      cartList[index].count = cartList[index].count! + count;
      cartList[index].total = cartList[index].total! + (count * model.price!);
    } else {
      cartList.add(CartModel(
        count: count,
        total: (count * model.price!).toDouble(),
        mealModel: model,
      ));
    }
    cartCount += count;
    calcTotals();
    storage.setCartList(cartList);
    if (afterAdd != null) afterAdd();
  }

  void removeFromCart({required CartModel model, Function? afterRemove}) {
    cartList.remove(model);
    calcTotals();
    storage.setCartList(cartList);
    cartCount -= model.count!;
    if (afterRemove != null) afterRemove();
  }

  void changeCount(
      {required bool incress,
      required CartModel model,
      Function? afterChange}) {
    CartModel result = getCartModel(model.mealModel!)!;
    int index = cartList.indexOf(result);

    if (incress) {
      result.count = result.count! + 1;
      result.total = result.total! + model.mealModel!.price!;
      cartCount++;
    } else {
      if (result.count! > 1) {
        result.count = result.count! - 1;
        result.total = result.total! - model.mealModel!.price!;
        cartCount--;
      }
    }
    cartList.remove(result);
    cartList.insert(index, result);
    calcTotals();

    storage.setCartList(cartList);
    if (afterChange != null) afterChange();
  }

  CartModel? getCartModel(MealModel model) {
    try {
      return cartList.firstWhere(
        (element) => element.mealModel!.id == model.id,
      );
    } catch (e) {
      return null;
    }
  }

  int getCartCount() {
    return cartList.fold(0, (sum, item) => sum + (item.count ?? 0));
  }

  void calcTotals() {
    subTotal.value = cartList.fold(0.0, (sum, element) => sum + element.total!);
    tax.value = subTotal.value * taxAmount;
    delivery.value = (subTotal.value + tax.value) * deliveryAmount;
    total.value = subTotal.value + tax.value + delivery.value;
  }

  void clearCart() {
    cartList.clear();
    storage.setCartList(cartList);
    cartCount.value = 0;
    calcTotals();
  }
}











// import 'package:food_order/core/data/models/apis/meal_models.dart';
// import 'package:food_order/core/data/models/cart_model.dart';
// import 'package:get/get.dart';
// import '../../ui/shared/utils.dart';

// class CartService {
//   // RxList<CartModel> cartList = <CartModel>[].obs;
//   // void loadCartList() {
//   //   cartList.value = storage.getCartList();
//   // }
//   List<CartModel> cartList = storage.getCartList();
//   // void removeFromCart(CartModel model) {
//   //   cartList.remove(model);
//   //   storage.setCartList(cartList);
//   // }

//   // Map<String, double> calcTotals() {
//   //   double subTotal = 0.0;
//   //   double tax = 0.0;
//   //   double deliveryFees = 0.0;
//   //   double total = 0.0;

//   //   subTotal =
//   //       cartList.fold(0.0, (sum, element) => sum + (element.total ?? 0.0));
//   //   tax = subTotal * taxAmount;
//   //   deliveryFees = (subTotal + tax) * deliveryAmount;
//   //   total = subTotal + tax + deliveryFees;
//   //   return {
//   //     "sub-total": subTotal,
//   //     "tax": tax,
//   //     "delivery": deliveryFees,
//   //     "total": total,
//   //   };
//   // }

//   CartModel findModel(int mealId) {
//     CartModel resultModel = cartList.firstWhere(
//       (element) => element.mealModel!.id == mealId,
//       orElse: () => CartModel(),
//     );
//     return resultModel;
//   }

//   int getModelIndex(CartModel resultModel) {
//     return resultModel.count != null ? cartList.indexOf(resultModel) : -1;
//   }

//   void addToCart({
//     required int count,
//     required double mealTotal,
//     required MealModel meal,
//   }) {
//     CartModel resultModel = findModel(meal.id!);
//     int index = getModelIndex(resultModel);
//     if (index != -1) {
//       cartList[index].count = cartList[index].count! + count;
//       cartList[index].total = cartList[index].total! + mealTotal;
//     } else {
//       cartList.add(CartModel(count: count, total: mealTotal, mealModel: meal));
//     }

//     storage.setCartList(cartList);
//   }

//   // CartModel cartModel = CartModel();
//   // bool isMealExist(int id) {
//   //   return cartModel.count != null;
//   // }

//   // int mealIndex() {
//   //   return cartList.indexOf(cartModel);
//   // }
// }
